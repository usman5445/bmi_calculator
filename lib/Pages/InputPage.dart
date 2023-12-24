import 'package:bmi_calculator/Components/BottomButton.dart';
import 'package:bmi_calculator/Controller.dart';
import 'package:flutter/material.dart';
import '../Components/ReusableCard.dart';
import '../Components/ReusableControlCard.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final Color _activeCardColor = Color(0xFFFFFFFF);
  final Color _inactiveCardColor = Color(0xFF8D8E98);
  double _height = 180;
  int _weight = 40;
  int _age = 20;
  Gender _selectedGender = Gender.male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      ReusableCard(
                        onPress: () {
                          setState(() {
                            _selectedGender = Gender.male;
                          });
                        },
                        icon: Icons.male,
                        title: 'MALE',
                        childColor: _selectedGender == Gender.male
                            ? _activeCardColor
                            : _inactiveCardColor,
                      ),
                      ReusableCard(
                        onPress: () {
                          setState(() {
                            _selectedGender = Gender.female;
                          });
                        },
                        icon: Icons.female,
                        title: 'FEMALE',
                        childColor: _selectedGender == Gender.female
                            ? _activeCardColor
                            : _inactiveCardColor,
                      )
                    ],
                  ),
                  ReusableControlCard(
                    title: 'HEIGHT',
                    value: _height.toStringAsFixed(0),
                    meter: 'cm',
                    actions: Slider(
                      min: 100,
                      max: 500,
                      value: _height,
                      onChanged: (h) => {
                        setState(() {
                          _height = h;
                        })
                      },
                    ),
                  ),
                  Row(
                    children: [
                      ReusableControlCard(
                        title: 'WEIGHT',
                        value: _weight.toString(),
                        actions: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton.filled(
                              onPressed: _weight > 0
                                  ? () => {setState(() => _weight--)}
                                  : null,
                              icon: Icon(
                                Icons.remove,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            IconButton.filled(
                              onPressed: _weight <= 500
                                  ? () => {setState(() => _weight++)}
                                  : null,
                              icon: Icon(
                                Icons.add,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      ReusableControlCard(
                        title: 'AGE',
                        value: _age.toString(),
                        actions: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton.filled(
                              onPressed: _age > 0
                                  ? () => {setState(() => _age--)}
                                  : null,
                              icon: Icon(
                                Icons.remove,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            IconButton.filled(
                              onPressed: _age <= 150
                                  ? () => {setState(() => _age++)}
                                  : null,
                              icon: Icon(
                                Icons.add,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              title: 'CALCULATE YOUR BMI',
              onPressed: () {
                CalculaterController calc = CalculaterController(
                    age: _age,
                    gender: _selectedGender,
                    height: _height,
                    weight: _weight);

                Navigator.pushNamed(context, '/result', arguments: {
                  'bmi': calc.getBmi(),
                  'result': calc.getResult(),
                  'interpretation': calc.getInterpretation(),
                });
              })
        ],
      ),
    );
  }
}
