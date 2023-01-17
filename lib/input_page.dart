import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const double bottomContainerHeight = 80;
const Color activeColor = Color(0xFF1D1E33);
const Color inactiveColor = Color(0xFF111328);
const Color pink = Color(0xFFEB1555);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(children: [
          Expanded(
              child: Row(children: [
            Expanded(
              child: ReusableCard(
                onPressed: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                color:
                    selectedGender == Gender.male ? activeColor : inactiveColor,
                cardChild: IconContent(
                    genderLabelText: 'MALE',
                    genderLabelIcon: FontAwesomeIcons.mars),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPressed: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                color: selectedGender == Gender.female
                    ? activeColor
                    : inactiveColor,
                cardChild: IconContent(
                  genderLabelText: 'FEMALE',
                  genderLabelIcon: FontAwesomeIcons.venus,
                ),
              ),
            ),
          ])),
          Expanded(child: ReusableCard(color: activeColor)),
          Expanded(
              child: Row(children: [
            Expanded(child: ReusableCard(color: activeColor)),
            Expanded(child: ReusableCard(color: activeColor))
          ])),
          Container(
            color: pink,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ]));
  }
}
