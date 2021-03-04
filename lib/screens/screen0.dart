import 'dart:ui';
import 'screen1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/helpers/carddata.dart';
import 'package:bmi_calculator/helpers/datacard.dart';
import 'package:bmi_calculator/helpers/const.dart';
import 'package:bmi_calculator/helpers/roundiconbutton.dart';
import 'package:bmi_calculator/helpers/mainbutton.dart';
import 'package:bmi_calculator/helpers/calculator.dart';

enum Gender {
  male,
  female,
}
Gender genderSelect;
int height = 180;
int weight = 60;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Datacard(
                  colour:
                      genderSelect == Gender.male ? ActiveColor : InactiveColor,
                  onPress: () {
                    setState(() {
                      genderSelect = Gender.male;
                    });
                  },
                  cardChild: Carddata(
                    cardtext: 'MALE',
                    cardicon: FontAwesomeIcons.mars,
                  ),
                ),
              ),
              Expanded(
                child: Datacard(
                  colour: genderSelect == Gender.female
                      ? ActiveColor
                      : InactiveColor,
                  onPress: () {
                    setState(() {
                      genderSelect = Gender.female;
                    });
                  },
                  cardChild: Carddata(
                      cardtext: 'FEMALE', cardicon: FontAwesomeIcons.venus),
                ),
              ),
            ],
          )),
          Expanded(
            child: Datacard(
                colour: Cardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: carddatastyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: numericdatastyle,
                        ),
                        Text(
                          'CM',
                          style: carddatastyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 50.0,
                      max: 275.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Datacard(
                    colour: Cardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: carddatastyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numericdatastyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Datacard(
                    colour: Cardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: carddatastyle,
                        ),
                        Text(
                          age.toString(),
                          style: numericdatastyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Mainbutton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Resultspage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
            title: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
