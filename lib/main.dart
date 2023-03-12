import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: Colors.black),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 170.0;
  double _weight = 75.0;
  int _bmi = 0;
  String _condition = 'Select Data';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
              height: size.height * 0.22,
              width: double.infinity,
              decoration: new BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "BMI",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 60.0),
                  ),
                  Text(
                    "Calculator",
                    style: TextStyle(color: Colors.black, fontSize: 40.0),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height * 0.09,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Height : ",
                        style: TextStyle(
                            color: Colors.amberAccent, fontSize: 25.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_height cm",
                            style: TextStyle(
                                fontFamily: 'RobotoMono',
                                color: Colors.amberAccent,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    thumbColor: Colors.grey,
                    value: _height,
                    min: 0,
                    max: 250,
                    onChanged: (height) {
                      setState(() {
                        _height = height;
                      });
                    },
                    divisions: 250,
                    label: "$_height",
                    activeColor: Colors.amberAccent,
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Weight : ",
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 25.0,
                            fontFamily: 'RobotoMono'),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_weight kg",
                            style: TextStyle(
                                fontFamily: 'RobotoMono',
                                color: Colors.amberAccent,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    thumbColor: Colors.grey,
                    value: _weight,
                    min: 0,
                    max: 250,
                    onChanged: (weight) {
                      setState(() {
                        _weight = weight;
                      });
                    },
                    divisions: 250,
                    label: "$_weight",
                    activeColor: Colors.amberAccent,
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 00.0, vertical: 20.0),
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300, 90),
                            primary: Colors.amberAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            backgroundColor: Colors.amberAccent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                height: size.height * .3,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Your BMI is $_bmi kg/m2',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30.0,
                                          fontFamily: 'RobotoMono',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '($_condition)',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25.0,
                                          fontFamily: 'RobotoMono',
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: const Size(130, 40),
                                            primary: Colors.black),
                                        child: const Text(
                                          'Close',
                                          style: TextStyle(
                                            color: Colors.yellowAccent,
                                            fontSize: 20.0,
                                            fontFamily: 'RobotoMono',
                                          ),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                          setState(() {
                            //18.5 - 25 Healthy 25-30 Overweight >30 Obesity
                            _bmi =
                                (_weight / ((_height / 100) * (_height / 100)))
                                    .round()
                                    .toInt();
                            if (_bmi >= 18.5 && _bmi <= 25) {
                              _condition = " Normal";
                            } else if (_bmi > 25 && _bmi <= 30) {
                              _condition = " Overweight";
                            } else if (_bmi > 30) {
                              _condition = " Obese";
                            } else {
                              _condition = " Underweight";
                            }
                          });
                        },
                        child: Text(
                          "Calculate",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoMono',
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
