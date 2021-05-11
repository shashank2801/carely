import 'package:flutter/material.dart';

import 'customText.dart';

class BottomBanner extends StatelessWidget {
  final Color color;

  const BottomBanner({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          title: "Developed by By Team SRV.",
          color: color,
        ),
      ],
    );
  }
}
