import 'package:flutter/material.dart';

import 'customText.dart';

class Button extends StatelessWidget {
  Button({this.text, this.color, @required this.onPressed, this.fw, this.fs});

  final String text;
  final Color color;
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
          minWidth: 150.0,
          height: 50.0,
          child: Text(text,style: TextStyle(fontWeight: fw,fontSize: fs),),
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Color color;

  const RoundButton({Key key,@required this.label, @required this.onPressed, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: color,
        child: CustomText(title: label,size: 25,weight: FontWeight.bold,),
        onPressed: onPressed);
  }
}