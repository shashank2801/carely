import 'package:carely/components/Button.dart';
import 'package:carely/components/customText.dart';
import 'package:carely/screens/auth/registrationScreen.dart';
import 'package:carely/services/authService.dart';
import 'package:carely/services/screen_navigation.dart';
import 'package:carely/utils/constants.dart';
import 'package:carely/utils/decorations.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
       // backgroundColor: Colors.white70,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Row(
              children: [
                BackButton(),
                CustomText(title: 'Back',weight: FontWeight.w700,size: 20,)
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Hero(
                    tag: 'Logo',
                    child: Container(
                      child: Image.asset(
                        'images/logo.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                      // height: 100.0,
                    ),
                  ),
                  Column(
                    children: [
                      CustomText(
                        title: 'Welcome Back',
                        size: 30,
                        //color: white,
                      ),
                      CustomText(
                        title: 'Log In',
                        size: 50,
                        weight: FontWeight.bold,
                        // color: white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Card(
              elevation: 10,
              borderOnForeground: true,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains("@")) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value.toString().trim();
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            icon: Icon(
                              Icons.mail,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter your email'),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        obscureText: _obscureText,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value.toString().trim();
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            icon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter your password'),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Button(
                        text: 'Log In',
                        color: Colors.lightBlueAccent,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            final message = await context
                                .read<AuthenticationService>()
                                .signIn(email: email, password: password);

                            if (message == "Signed In")
                              Navigator.pop(context);
                            else
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(message)));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.18,),
            Row(
              children: [
SizedBox(width: MediaQuery.of(context).size.width*.1,),
                 CustomText(title: "Don't have an account yet? ",size: 16,),
                      GestureDetector(
                        onTap: (){changeScreen(context, RegistrationScreen());},
                        child: CustomText(title: "Register Now",color: green,weight: FontWeight.bold,size: 16,),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
