import 'package:Quiz/answer.dart';
import 'package:Quiz/question.dart';
import 'package:Quiz/quiz.dart';
import 'package:Quiz/result.dart';
import 'package:flutter/material.dart';

main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

Color bodyColor = Colors
    .white; //تم التعريف خارج الكلاس لكي نتمكن من استدعائهم في الكلاسات الاخرى
Color textColor = Colors.black;

class _MyappState extends State<Myapp> {
  bool isSwitched = false;

  int _totalScore = 0;
  int _questionIndex = 0;
  List num =
      []; //  نخزن فيه الارقام المضافة للتوتال كي نقوم بالانقاص عند الرجوع للوراء
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      num.clear();
    });
  }

  void answerQuestion(score) {
    num.add(score);
    _totalScore += score;
    /*if (_questionIndex == 2) {
      _questionIndex = -1;
    }*/
    setState(() {
      _questionIndex += 1;
    });

    print("Answer chosen !");
    print("last num in list is ${num.last}");
    print('Total score is $_totalScore');
  }

  final List<Map<String, Object>> _questions = [
    {
      "questionText": "What\'s your favorite color ?",
      "answers": [
        {"text": "Red", "score": 10},
        {"text": "Green", "score": 20},
        {"text": "Blue", "score": 30},
        {"text": "Yellow", "score": 40}
      ]
    },
    {
      "questionText": "What\'s your favorite animal ?",
      "answers": [
        {"text": "Tiger", "score": 10},
        {"text": "Lion", "score": 20},
        {"text": "Panter", "score": 30},
        {"text": "Elephant", "score": 40}
      ]
    },
    {
      "questionText": "What\'s your favorite food ?",
      "answers": [
        {"text": "Makloube", "score": 10},
        {"text": "Kabse", "score": 20},
        {"text": "Mulukhya", "score": 30},
        {"text": "Kubbe", "score": 40}
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.green)),
      debugShowCheckedModeBanner: false, //يمسح الشريط المائل على اعلى التطبيق
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                //البارامتر ضروري
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                  if (value == false) {
                    bodyColor = Colors.white;
                    textColor = Colors.black;
                  } else {
                    bodyColor = Colors.black;
                    textColor = Colors.white;
                  }
                });
              },
              activeColor: textColor,
              inactiveThumbColor: textColor,
              inactiveTrackColor: textColor,
            ),
          ],
          title: Text(
            "Quiz App",
            style: TextStyle(color: bodyColor),
          ),
        ),
        body: Container(
          color: bodyColor,
          child: _questionIndex < _questions.length
              ? Quiz(_questions, answerQuestion, _questionIndex) // ما فهمت

              : Result(_resetQuiz, _totalScore),
        ),
        floatingActionButton: FloatingActionButton(
          //backgroundColor: Theme.of(context).primaryColor,
          //backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              if (_questionIndex > 0) {
                _questionIndex -= 1;
                _totalScore -= num[num.length - 1];
                num.removeLast();

                if (num.length != 0) {
                  print("last number in list is ${num.last}");
                } else {
                  print("list is empty !! ");
                }
              } else {
                _totalScore = 0;
              }
              print('Total score is $_totalScore');
            });
          },
          child: Icon(
            Icons.arrow_back,
            color: bodyColor,
          ),
        ),
      ),
    );
  }
}
