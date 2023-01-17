import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const double bottomContainerHeight = 80;
const Color purple = Color(0xFF1D1E33);
const Color pink = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                color: purple,
                cardChild: IconContent(
                    genderLabelText: 'MALE',
                    genderLabelIcon: FontAwesomeIcons.mars),
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: purple,
                cardChild: IconContent(
                  genderLabelText: 'FEMALE',
                  genderLabelIcon: FontAwesomeIcons.venus,
                ),
              ),
            ),
          ])),
          Expanded(child: ReusableCard(color: purple)),
          Expanded(
              child: Row(children: [
            Expanded(child: ReusableCard(color: purple)),
            Expanded(child: ReusableCard(color: purple))
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
