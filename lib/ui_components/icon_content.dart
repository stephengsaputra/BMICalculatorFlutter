import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final String genderLabelText;
  final IconData genderLabelIcon;

  IconContent({@required this.genderLabelText, @required this.genderLabelIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(genderLabelIcon, size: 80),
        SizedBox(height: 10),
        Text(
          genderLabelText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
