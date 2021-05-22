import 'package:carely/components/banner.dart';
import 'package:carely/components/customText.dart';
import 'package:carely/models/user.dart';
import 'package:carely/screens/bmi.dart';
import 'package:carely/screens/disclaimer.dart';
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
  final userRef = FirebaseFirestore.instance.collection("users");
  UserModel _currentUser;
  String _uid = '', _user = '', _email = '';

  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  getCurrentUser() async {
    UserModel currentUser = await context
        .read<AuthenticationService>()
        .getUserFromDB(uid: auth.currentUser.uid);

    _currentUser = currentUser;

    setState(() {
      _uid = _currentUser.uid;
      _user = _currentUser.username;
      _email = _currentUser.email;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              CustomText(title: 'Hello $_user',weight: FontWeight.bold,size:24),
              MaterialButton(
                elevation: 5,
                color: Colors.red,
                disabledColor: Colors.teal,
                child: CustomText(title: "BMI"),
                onPressed: (){changeScreen(context, BMI());},
              ),
              MaterialButton(
                elevation: 5,
                color: Colors.red,
                disabledColor: Colors.teal,
                child: CustomText(title: "Resources"),
                onPressed: (){changeScreen(context, Disclaimer());},
              ),
            ],
          ),
          bottomNavigationBar: BottomBanner(color: black,),
          ),
          
    );
  }
}
