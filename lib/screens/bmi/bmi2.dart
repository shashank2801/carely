import 'package:carely/components/Button.dart';
import 'package:carely/components/banner.dart';
import 'package:carely/components/bottomButton.dart';
import 'package:carely/components/customText.dart';
import 'package:carely/services/authService.dart';
import 'package:carely/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

enum Gender {
  male,
  female,
}

class BMIResult extends StatelessWidget {
  final String bmi, result, interpret;
  const BMIResult({Key key, this.bmi, this.result, this.interpret}) : super(key: key);


  

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid;
    final DateTime timestamp = DateTime.now();
    return SafeArea(
      child: Scaffold(
       // backgroundColor: white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    title: "Your Results",
                    size: 30,
                    weight: FontWeight.bold,
                    
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.lime, Colors.orange],begin: Alignment.topLeft,end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(title:bmi,size: 80,weight: FontWeight.bold,color: black,),
                      CustomText(title:result,size: 25,weight: FontWeight.w500,color: black,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(title:interpret,size: 20,color: black,),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Button(onPressed: () async{
              final message = await context
              .read<AuthenticationService>()
              .addBMIDetails(
                uid: auth.currentUser.uid,
                bmi: bmi,
                timestamp: timestamp);
                print(message);
                if(message == "Entry done"){
                  ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("BMI Details Saved.")));
                  
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Error! Please try again.")));
                    
                  }
            },text: "Save",),
            BottomButton(
              onPress: () {
                Navigator.pop(context);
              },
              label: "Re-Calculate",
            ),
            BottomBanner(color: black),
          ],
        ),
      ),
    );
  }
}
