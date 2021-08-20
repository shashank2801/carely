
import 'package:carely/components/customText.dart';

import 'package:carely/screens/bmi/bmi.dart';
import 'package:carely/screens/bp.dart';
import 'package:carely/screens/portal/disclaimer.dart';
import 'package:carely/screens/user.dart';
import 'package:carely/services/authService.dart';
import 'package:carely/services/screen_navigation.dart';
import 'package:carely/utils/constants.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
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
                      changeScreen(context, UserProfile());
                    }),
              ],
            ),
          )),
    );
  }
}
