import 'package:carely/screens/auth/authScreen.dart';
import 'package:carely/screens/auth/loginScreen.dart';
import 'package:carely/screens/auth/registrationScreen.dart';
import 'package:carely/utils/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/authService.dart';
import 'components/routes.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// void main() {
//   runApp(App());
// }

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context,snapshot){
        if(snapshot.hasError)
          return Text("Error");
        
        if(snapshot.connectionState == ConnectionState.done)
          return MyApp();

        return CircularProgressIndicator.adaptive();
      }
      );
  }
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges),
      ],
      child: MaterialApp(
        title: 'Carely',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        themeMode: ThemeMode.system,
        routes: {
          Routes.auth_screen : (context) => AuthScreen(),
          Routes.login_screen : (context) => LoginScreen(),
          Routes.registration_screen : (context) => RegistrationScreen(),
          // Routes.home_screen : (context) => HomeScreen(),
        },
        home: WrapperClass(),
      ),
    );
  }
}

