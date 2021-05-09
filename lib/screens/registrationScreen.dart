import 'package:carely/components/Button.dart';
import 'package:carely/components/customText.dart';
import 'package:carely/components/routes.dart';
import 'package:carely/services/authService.dart';
import 'package:carely/services/screen_navigation.dart';
import 'package:carely/utils/constants.dart';
import 'package:carely/utils/decorations.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'loginScreen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String email;
  String password;
  String username;
  FirebaseAuth auth = FirebaseAuth.instance;
  final DateTime timestamp = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                  Row(
              children: [
                BackButton(),
                CustomText(title: 'Back',weight: FontWeight.w700,size: 20,)
              ],
            ),
                 SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Hero(
                        tag: 'Logo',
                        child: Container(
                          child: Image.asset('images/logo.png',height: 100,width: 100,),
                        ),
                      ),
                      Column(
                        children: [
                          CustomText(
                            title: 'Hey There',
                            size: 30,
                            //color: white,
                          ),
                          CustomText(
                            title: 'Sign Up',
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
                      SizedBox(height: MediaQuery.of(context).size.height*0.03),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          username = value.toString().trim();
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            icon: Icon(
                              Icons.face,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter your name'),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }

                          if (!value.contains("@")) return "Invalid Email";
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
                        text: 'Register',
                        color: Colors.blueAccent,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            final message = await context
                                .read<AuthenticationService>()
                                .signUp(email: email, password: password);

                            if (message == "Signed Up") {
                              print('hello');
                              context.read<AuthenticationService>().addUserToDB(
                                  uid: auth.currentUser.uid,
                                  username: username,
                                  email: auth.currentUser.email,
                                  timestamp: timestamp);
                              Navigator.popAndPushNamed(
                                  context, Routes.login_screen);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(message)));
                            }
                          }
                        },
                      ),
                    
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.18,),
                  CustomText(title: "Already have an account? ",size: 16,),
                  GestureDetector(
                        onTap: (){changeScreen(context, LoginScreen());},
                        child: CustomText(title: "Login",weight: FontWeight.bold,color: green,size: 16,),
                      )
                ],
              ),
                      
          ],
        ),
      ),
    );
  }
}
