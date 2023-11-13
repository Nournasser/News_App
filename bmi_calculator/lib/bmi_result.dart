import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {

  double result;
  int age;
  bool isMale;

  BMIResult({
    @required this.age,
    @required this.isMale,
    @required this.result,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'BMI Result',
        ),
      ),
      body: Container(
        color: Colors.teal[900],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your BMI Result',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.cyan[900],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Gender: ${isMale ? 'Male' : 'Female'}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                          'Result: ${result.round()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'Type: ${
                        result.round() < 18.5 ? 'UnderWeight' :
                            result.round() < 24.9 ? 'Normal Weight' :
                                result.round() < 29.9 ? 'OverWeight' :
                                    result.round() < 34.9 ? 'Obesity' :
                                        'Extreme Obesity'
                        }',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                          'Great work! Keep it up!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
