import 'package:carely/utils/constants.dart';
import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  final String title;
  final double size;
  final Color color;
  final FontWeight weight;

  const CustomText({Key key, @required this.title, this.size, this.color, this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,style: TextStyle(fontSize: size ?? 16, fontWeight: weight ?? FontWeight.normal, color: color?? white),
    );
  }
}