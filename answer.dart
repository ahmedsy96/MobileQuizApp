import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function x;

  Answer(this.x, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(
          answerText,
          style: TextStyle(fontSize: 20),
        ),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: x,
      ),
    );
  }
}
