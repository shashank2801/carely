import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain{
  final int height,weight;
  
  double _bmi;

  CalculatorBrain(this.height, this.weight);
  String calcBMI(){
    _bmi = weight / pow((height/100),2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >=25)
      return 'Overweight';
    else if(_bmi>18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation(){
    if(_bmi >=25)
      return 'You are slightly over the edge. Try working out more often!';
    else if(_bmi>18.5)
      return 'Perfect. Try to maintain your lifestyle.';
    else
      return 'Try eating more healthy things and puton some weight.';
  }
}