import 'package:flutter/material.dart';

import 'customText.dart';

class Button extends StatelessWidget {
  Button({this.text, this.color, @required this.onPressed, this.fw, this.fs, this.textColor});

  final String text;
  final Color color;
  final Color textColor;
  final Function onPressed;
  final FontWeight fw;
  final double fs;
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 125.0,
          height: 50.0,
          child: CustomText(title: text,weight: fw,size: fs,color: textColor,),),
        ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Color color;
  final Color textColor;

  const RoundButton({Key key,@required this.label, @required this.onPressed, this.color, this.textColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: color,
        child: CustomText(title: label,size: 25,weight: FontWeight.bold,color: textColor,),
        onPressed: onPressed);
  }
}