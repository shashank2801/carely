import 'package:carely/components/customText.dart';
import 'package:carely/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onPress;
  final String label;

  const BottomButton({Key key, this.onPress, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: onPress,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  width: double.infinity,
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        title: label,
                        color: white,
                        weight: FontWeight.bold,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
            );
  }
}