import 'package:carely/screens/auth/authScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:carely/screens/dashboard.dart';

class WrapperClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User>();
    if (firebaseuser != null)
      return HomePage();
    else
      return AuthScreen();
  }
}