import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carely/components/customText.dart';
import 'package:carely/screens/portal/portal.dart';
import 'package:carely/services/screen_navigation.dart';
import 'package:carely/utils/constants.dart';

import 'package:flutter/material.dart';

class Disclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: green,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0)),
                  ),
                  height: MediaQuery.of(context).size.height * .7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning_rounded,
                        color: Colors.red,
                        size: 120,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: [
                            CustomText(
                              title:
                                  "Though we are trying to help everyone to the best of our abilities users are advised to be vigiliant while doing their bit.\nVerify the person before taking actions about the same.",
                              weight: FontWeight.w700,
                              size: 18,
                              color: black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .2),
                GestureDetector(
                  onHorizontalDragUpdate: (DragUpdateDetails) {
                    changeScreen(context, Portal());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedTextKit(
                        isRepeatingAnimation: true,
                        repeatForever: true,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            "<<< ",
                            textStyle: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                            speed: const Duration(milliseconds: 400),
                          ),
                        ],
                      ),
                      CustomText(
                        title: "Swipe To Continue",
                        size: 25,
                        weight: FontWeight.w700,
                      ),
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            " >>>",
                            textStyle: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                            speed: const Duration(milliseconds: 400),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
