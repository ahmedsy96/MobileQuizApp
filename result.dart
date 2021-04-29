//import 'dart:html';

import 'package:Quiz/main.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetQyiz;
  final int totalscore;
  Result(this.resetQyiz, this.totalscore);

  String get resultPhrase {
    String resultText;
    if (totalscore >= 70) {
      resultText = 'You Are awesome';
    } else if (totalscore >= 40) {
      resultText = 'pretty Likable';
    } else {
      resultText = 'You Are So Bad !';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              "Restart The App !!",
              style: TextStyle(
                  fontSize: 30, color: Theme.of(context).primaryColor),
            ),
            onPressed: resetQyiz,
          ),
          Text(
            "your total score is $totalscore !!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
