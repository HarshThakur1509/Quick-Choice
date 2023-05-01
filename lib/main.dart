
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showSplashScreen = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        _showSplashScreen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _showSplashScreen
          ? Scaffold(
        body: Center(
          child: Image.asset(
            'assets/logo.png',
            width: 300.0,
            height: 300.0,
          ),
        ),
      )
          : YesNoApp(),
    );
  }
}

class YesNoApp extends StatefulWidget {
  @override
  _YesNoAppState createState() => _YesNoAppState();
}

  class _YesNoAppState extends State<YesNoApp> {
  String answer = '';
  final _textController = TextEditingController();

  void _getRandomAnswer() {
  if (_textController.text.trim().isEmpty) {
  showDialog(
  context: context,
  builder: (context) => AlertDialog(
  title: Text('Error'),
  content: Text('Please enter your question'),
  actions: [
  TextButton(
  onPressed: () => Navigator.pop(context),
  child: Text('OK'),
  )
  ],
  ),
  );
  return;
  }

  setState(() {
  answer = '';
  });
  Future.delayed(Duration(milliseconds: 100), () {
  setState(() {
  answer = Random().nextBool() ? 'YES' : 'NO';
  });
  });
  _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Color.fromRGBO(5, 195, 221, 1);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor,
        leading: Image.asset(
          'assets/invert_logo.png',
          width: 50.0,
          height: 50.0,
        ),
        title: Text('Quick Choice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Transform.translate(
              offset: Offset(0, 0),
              child: Text(
                'Should I do it?',
                style: TextStyle(fontSize: 32.0,
                  fontFamily: 'CastoroTitling-Regular',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 46.0),
            Transform.translate(
              offset: Offset(0, 0),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Enter your question',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),

            Transform.translate(
              offset: Offset(0, 60),
              child: ElevatedButton(
                onPressed: _getRandomAnswer,
                child: Text(
                  'Ask',
                  style: TextStyle(fontSize: 25.0),
                ),
                style: ElevatedButton.styleFrom(
                  primary: buttonColor,
                  minimumSize: Size(220, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),

            SizedBox(height: 60.0),
            Transform.translate(
              offset: Offset(0, 40),
              child: Text(
                answer,
                style: TextStyle(
                  fontSize: 100.0,
                  fontFamily: 'CastoroTitling-Regular',
                  fontWeight: FontWeight.bold,
                  color: answer == 'YES' ? Colors.green : Colors.red,
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}

