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
  final Gender selectedGender;
  final int height, age, weight;

  const BMIResult(
      {Key key, this.selectedGender, this.height, this.age, this.weight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
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
                    color: black,
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
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Score"),
                      Text("Gyaan"),
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
