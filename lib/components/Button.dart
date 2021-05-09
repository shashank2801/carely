import 'package:flutter/material.dart';

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