
import 'package:carely/components/customText.dart';
import 'package:carely/models/user.dart';

import 'package:carely/screens/bmi/bmi.dart';
import 'package:carely/screens/bp.dart';
import 'package:carely/screens/portal/disclaimer.dart';
import 'package:carely/screens/user.dart';
import 'package:carely/services/authService.dart';
import 'package:carely/services/screen_navigation.dart';
import 'package:carely/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = "";
  // final userRef = FirebaseFirestore.instance.collection("users");
  UserModel _currentUser;
  void initState(){
    super.initState();
    getCurrentUser();
  }

  getCurrentUser() async {
    await context.read<AuthenticationService>().loadUser(uid: auth.currentUser.uid);
  }

  // final Stream<DocumentSnapshot> _stream = FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
  @override
  Widget build(BuildContext context) {
    bool loaded = false;
    final screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: green,
            leading: null,
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.logout,
                    size: 24,
                    color: white,
                  ),
                  onPressed: () {
                    context.read<AuthenticationService>().signOut();
                  }),
            ],
          ),
          body: Column(
            children: [
              MaterialButton(
                elevation: 5,
                color: Colors.red,
                disabledColor: Colors.teal,
                child: CustomText(title: "BMI"),
                onPressed: () {
                  changeScreen(context, BMI());
                },
              ),
              MaterialButton(
                elevation: 5,
                color: Colors.green,
                disabledColor: Colors.teal,
                child: CustomText(title: "BP"),
                onPressed: () {
                  changeScreen(context, BP());
                },
              ),
              // MaterialButton(
              //   elevation: 5,
              //   color: Colors.blue,
              //   disabledColor: Colors.teal,
              //   child: CustomText(title: "Get BP"),
              //   onPressed: () {
              //     bp = context.read<AuthenticationService>().getBPFromDB(uid: uid);
              //     // bp = context.read<AuthenticationService>().resultBPList;
              //     print("hello");
              //     print(bp);
              //   },
              // ),
              
            ],
          ),
          bottomNavigationBar: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.home,
                      size: screenheight * .04,
                      color: black,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.wysiwyg_sharp,
                      size: screenheight * .04,
                      color: black,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.calendar_today,
                      color: black,
                      size: screenheight * .04,
                    ),
                    onPressed: () {
                      changeScreen(context, Disclaimer());
                    }),
                IconButton(
                    icon: Icon(
                      Icons.person,
                      color: black,
                      size: screenheight * .04,
                    ),
                    onPressed: () {
                      changeScreen(context, UserProfile(currentUser: _currentUser,));
                    }),
                
              ],
            ),
          )),
    );
  }
}
