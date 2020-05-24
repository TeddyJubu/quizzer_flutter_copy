//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzer_flutter_copy/quizBrain.dart';
//import 'questions.dart';

QuizBrain brain = QuizBrain();

void main() {
  runApp(QuizPage());
}

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Center(
            child: Text('Quizzer'),
          ),
        ),
        body: Container(
          child: Quizzer(),
        ),
      ),
    );
  }
}

class Quizzer extends StatefulWidget {
  @override
  _QuizzerState createState() => _QuizzerState();
}

class _QuizzerState extends State<Quizzer> {
  List<Icon> scoreKeeper = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Center(
                child: Text(
                  brain.statement(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green.shade500,
              onPressed: () {
                bool correctAnswer = brain.answer();
                if (correctAnswer == true) {
                  print("right answer");
                } else {
                  print('wrong answer');
                }
                setState(() {
                  scoreKeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                  brain.answerIndex();
                });
              },
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red.shade500,
              onPressed: () {
                bool correctAnswer = brain.answer();
                if (correctAnswer == false) {
                  print("right answer");
                } else {
                  print('wrong answer');
                }
                setState(() {
                  scoreKeeper.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                  brain.answerIndex();
                });
              },
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
