import 'package:carely/components/banner.dart';
import 'package:carely/components/bottomButton.dart';
import 'package:carely/components/customText.dart';
import 'package:carely/utils/constants.dart';
import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}

class BMIResult extends StatelessWidget {
  final String bmi, result, interpret;

  const BMIResult({Key key, this.bmi, this.result, this.interpret}) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
              flex: 6,
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
