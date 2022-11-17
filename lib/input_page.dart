import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';
import 'constans.dart';
import 'icon_content.dart';
import 'result_page.dart';
import 'reusable_card.dart';
import 'round_icon_buttom.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  // late Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20 ;

  Color maleCardColor = kInactiveCardColor;
  Color femalCardColor = kInactiveCardColor;

//1 = male , 2 = female
  void updataColour(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColor == kInactiveCardColor) {
        maleCardColor = kActiveCardColor;
        femalCardColor = kInactiveCardColor;
      } else {
        maleCardColor = kInactiveCardColor;
      }
    }
    if (selectedGender == Gender.female) {
      if (femalCardColor == kInactiveCardColor) {
        femalCardColor = kActiveCardColor;
        maleCardColor = kInactiveCardColor;
      } else {
        femalCardColor = kInactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: const Text("                    BMI CALCULATOR"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        updataColour(Gender.male);
                       // selectedGender = Gender.male;
                      });
                    },
                    colour:maleCardColor,
                    // selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        updataColour(Gender.female);
                        //selectedGender = Gender.female;
                      });
                    },
                    colour: femalCardColor,
                   // selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                onPress: () {},
                colour: kActiveCardColor,
                cardChild: Column(
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kNumberTextStyle),
                        const Text(
                          'cm ',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTickMarkColor: Color(0xFF8D8E98),
                          activeTickMarkColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape: const RoundSliderThumbShape( enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape( overlayRadius: 30.0),
                        ),
                        child: Slider(
                          //thumbColor: Colors.white,
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: Color(0xFFEB1555),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {},
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState((){
                                  weight--;
                                });
                              },),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState((){
                                  weight++;
                                });
                              },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {},
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE' ,
                          style: kLabelTextStyle,),
                          Text(age.toString() , style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                                setState((){
                                  age--;
                                });
                              }),
                              SizedBox(width: 10.0,),
                              RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                                setState((){
                                  age++;
                                });
                              }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitel: 'CALCULATE',
              onTap: (){
                CalculatorBrain cale = CalculatorBrain(height: height , weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: cale.calculateBMI(),
                resultText: cale.getResult(),
                interpretation: cale.getInterPretation(),

              ),
              ),
              );
            },),
          ],
        ));
  }
}


