import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;
  final double heigthSize;



  const DefaultButton({Key key, this.text, this.press, this.color, this.heigthSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: heigthSize != null ? heigthSize: 56,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}