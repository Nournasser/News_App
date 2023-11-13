import 'dart:math';

import 'package:bmi_calculator/bmi_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bmi_screen extends StatefulWidget {

  @override
  State<bmi_screen> createState() => _bmi_screenState();
}

class _bmi_screenState extends State<bmi_screen> {

  bool isMale = true;
  double height = 160.0;
  int weight = 96;
  int age = 64;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator'
        ),
        backgroundColor: Colors.cyan[900],
      ),
      body: Container(
        color: Colors.teal[900],
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isMale ?  Colors.blue : Colors.cyan[900],
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/male.png',
                                height: 70,
                                width: 70,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isMale ? Colors.cyan[900] : Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/female.png',
                                width: 70,
                                height: 70,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                  'Female',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.cyan[900],
                      borderRadius: BorderRadius.all(Radius.circular(20))

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Height',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${height.round()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                              Text(
                                'cm',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                          Slider(value: height,
                              min: 80.0,
                              max: 220.0,
                              onChanged:(value) {
                            setState(() {
                              height = value;
                            });
                              },)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(

                              color: Colors.cyan[900],
                              borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Weight (KG)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                                '$weight',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                  heroTag: 'weight+',
                                  mini: true,
                                child: Icon(
                                  Icons.add,
                                ),),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                  heroTag: 'weight-',
                                mini: true,
                                child: Icon(
                                  Icons.remove,
                                ),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                              color: Colors.cyan[900],
                              borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          children: [
                            Text(
                                'Age',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                                '$age',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                  heroTag: 'age+',
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                  ),),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                  heroTag: 'age-',

                                  mini: true,
                                  child: Icon(
                                    Icons.remove,
                                  ),),
                              ],
                        ),
                  ],
                ),
                      ),
                    ),
          ],
        ),
              ),
            ),
            ElevatedButton(
              child: Text(
                  'Calculate'
              ),
              onPressed: ()
              {
                var result = weight / pow(height / 100 , 2);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BMIResult(
                      isMale: isMale,
                      result: result,
                      age: age,
                    ),
                ),
                );
              },
            ),
        ]
        ),
      )
    );
  }
}


