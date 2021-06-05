import 'package:carely/components/Button.dart';
import 'package:carely/components/banner.dart';
import 'package:carely/components/bottomButton.dart';
import 'package:carely/components/customText.dart';
import 'package:carely/components/reusableCard.dart';
import 'package:carely/screens/bmi/bmi2.dart';
import 'package:carely/services/calcBMI.dart';
import 'package:carely/services/screen_navigation.dart';
import 'package:carely/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activated = Colors.blueGrey;
const inactivated = grey;

enum Gender {
  male,
  female,
}

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  Gender selectedGender;
  int height = 180;
  int age = 18;
  int weight = 50;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? activated
                          : inactivated,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "Male",
                      ),
                    ),
                  ),
                  Expanded(
                    
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? activated
                          : inactivated,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "Female",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: grey,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        title: "Height", size: 20, weight: FontWeight.w800,color: black,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        CustomText(
                          title: height.toString(),
                          size: 80,
                          weight: FontWeight.bold,
                        ),
                        CustomText(
                          title: "cm",
                          size: 20,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: white,
                        inactiveTrackColor: black,
                        thumbColor: Colors.red,
                        overlayColor: Colors.red[100],
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0),
                      ),
                      child: Slider(
                          min: 120.0,
                          max: 220.0,
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: Colors.blueGrey,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              title: "Weight",
                              size: 20,
                              weight: FontWeight.w800),
                          CustomText(
                            title: weight.toString(),
                            size: 70,
                            weight: FontWeight.bold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RoundButton(
                                label: "-",
                                textColor: black,
                                onPressed: () {
                                  setState(
                                    () {
                                      weight--;
                                    },
                                  );
                                },
                                color: white,
                              ),
                              RoundButton(
                                label: "+",
                                textColor: black,
                                onPressed: () {
                                  setState(
                                    () {
                                      weight++;
                                    },
                                  );
                                },
                                color: white,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: Colors.blueGrey,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              title: "Age", size: 20, weight: FontWeight.w800),
                          CustomText(
                              title: age.toString(),
                              size: 70,
                              weight: FontWeight.bold),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RoundButton(
                                label: "-",
                                textColor: black,
                                onPressed: () {
                                  setState(
                                    () {
                                      age--;
                                    },
                                  );
                                },
                                color: white,
                              ),
                              RoundButton(
                                label: "+",
                                textColor: black,
                                onPressed: () {
                                  setState(
                                    () {
                                      age++;
                                    },
                                  );
                                },
                                color: white,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onPress: () {
                CalculatorBrain calc = CalculatorBrain(height, weight);

                String bmi = calc.calcBMI();
                String result = calc.getResult();
                String interpret = calc.getInterpretation();

                changeScreen(
                    context,
                    BMIResult(
                      bmi: bmi,
                      result: result,
                      interpret: interpret,
                    ));
              },
              label: "Calculate",
            ),
            BottomBanner(
              color: black,
            )
          ],
        ),
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconContent({Key key, @required this.icon, @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.deepPurple,
        ),
        CustomText(
          title: label,
          size: 25,
        ),
      ],
    );
  }
}
