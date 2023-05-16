import 'dart:js_util';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'calc_app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
 const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
enum CALC_TYPE { add, sub, multi, div }

class _MyHomePageState extends State<MyHomePage> {
  int _setNumber = 0;
  int _displayNumber = 0;
  int _firstNum = 0;
  CALC_TYPE? _calcType;


  void _setNum(int num) {
    _displayNumber = _setNumber;
    if (100000000 > _displayNumber ) {
      setState(() {
        _displayNumber = _displayNumber * 10 + num;
        _setNumber = _displayNumber;
      });
    }
  }

  void _calcBtnPressed(CALC_TYPE type) {
    _firstNum = _setNumber;
    _setNumber = 0;
    _displayNumber = 0;
    _calcType = type;
  }

  void _calcAdd(){
    setState(() {
      _displayNumber = _firstNum + _setNumber;
      _firstNum = _displayNumber;
    });
  }

  void _clearNum() {
    setState(() {
      _setNumber = 0;
      _displayNumber = 0;
      _firstNum = 0;
      _calcType = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.end,
          children: [
            Text(
              _displayNumber.toString(),
              style: TextStyle(
                fontSize: 80,
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                   Expanded(
                     child: Row(
                      children: [
                        Expanded(
                         child: OutlinedButton(
                           onPressed: () {
                             _setNum(7);
                           },
                           child: Text("7",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               fontSize: 60,
                             ),
                           ),
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              _setNum(8);
                            },
                          child: Text("8",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 60,
                            ),
                          ),
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              _setNum(9);
                            },
                          child: Text("9",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 60,
                            ),
                          ),
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                          child: Text("÷",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 60,
                              ),
                            ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   Expanded(
                     child: Row(
                      children: [
                        Expanded(
                         child: OutlinedButton(
                         onPressed: () {
                           _setNum(4);
                         },
                          child: Text("4",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 60,
                            ),
                          ),
                         ),
                        ),
                        Expanded(
                         child: OutlinedButton(
                         onPressed: () {
                           _setNum(5);
                         },
                          child: Text("5",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 60,
                            ),
                          ),
                         ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              _setNum(6);
                            },
                            child: Text("6",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text("×",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ),
                      ],
                     ),
                   ),
                   Expanded(
                     child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              _setNum(1);
                            },
                            child: Text("1",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              _setNum(2);
                            },
                            child: Text("2",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              _setNum(3);
                            },
                            child: Text("3",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text("-",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ),
                      ],
                     ),
                   ),
                   Expanded(
                     child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              _clearNum();
                            },
                            child: Text("C",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              _setNum(0);
                            },
                            child: Text("0",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              switch (_calcType){
                                case CALC_TYPE.add:
                                _calcAdd();
                                  break;
                                case CALC_TYPE.sub:
                                  break;
                                case CALC_TYPE.multi:
                                  break;
                                case CALC_TYPE.div:
                                  break;
                                default:
                                  break;
                             }
                            },
                            child: Text("=",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                             _calcBtnPressed(CALC_TYPE.add);
                            },
                            child: Text("+",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ),
                      ],
                     ),
                   ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
