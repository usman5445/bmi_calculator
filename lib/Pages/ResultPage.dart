import 'package:bmi_calculator/Components/BottomButton.dart';
import 'package:flutter/material.dart';

class ResultsPages extends StatelessWidget {
  const ResultsPages({super.key});
  @override
  Widget build(BuildContext context) {
    Map<String, String> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Your Result',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFF111428),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${arguments['result']}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF22E67B),
                              ),
                            ),
                            Text(
                              '${arguments['bmi']}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 100,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Normal BMI range:',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF9396A8),
                                  ),
                                ),
                                Text(
                                  '18.5 - 25 kg/m2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${arguments['interpretation']}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'RE-CALCULATE YOUR BMI',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
