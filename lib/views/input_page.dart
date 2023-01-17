import 'package:bmi_calculator/views/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../ui_components/icon_content.dart';
import '../ui_components/reusable_card.dart';
import '../constants.dart';
import '../ui_components/round_icon_button.dart';
import '../ui_components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

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
  int height = 180;
  int weight = 60;
  int age = 17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Male and Female Buttons
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveColor
                        : kInactiveColor,
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
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: IconContent(
                      genderLabelText: 'FEMALE',
                      genderLabelIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('$height', style: kBoldTextStyle),
                      SizedBox(width: 5),
                      Text('cm', style: kLabelTextStyle)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          thumbColor: kPink,
                          activeTrackColor: Colors.white,
                          overlayColor: kPink.withAlpha(29)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        inactiveColor: kInactiveColor,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(children: [
            Expanded(
                child: ReusableCard(
              color: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('WEIGHT', style: kLabelTextStyle),
                  Text('$weight', style: kBoldTextStyle),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                          iconData: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          }),
                      SizedBox(width: 20),
                      RoundIconButton(
                          iconData: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          })
                    ],
                  )
                ],
              ),
            )),
            Expanded(
                child: ReusableCard(
              color: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('AGE', style: kLabelTextStyle),
                  Text('$age', style: kBoldTextStyle),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        iconData: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                      SizedBox(width: 20),
                      RoundIconButton(
                        iconData: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            ))
          ])),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              calc.calculateBMI();

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpertation(),
                );
              }));
            },
          )
        ],
      ),
    );
  }
}
