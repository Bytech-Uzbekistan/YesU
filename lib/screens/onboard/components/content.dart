import 'package:flutter/material.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key key,
    this.text,

  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
      ],
    );
  }
}