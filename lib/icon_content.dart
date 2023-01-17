import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(fontSize: 18, color: Color(0xFF8D8E98));

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
          style: labelTextStyle,
        ),
      ],
    );
  }
}
