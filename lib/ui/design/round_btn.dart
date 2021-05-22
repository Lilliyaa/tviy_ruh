import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final fontSize;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color,
    this.textColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //width: size.width *0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
          color: Color.fromRGBO(254, 187, 87, 1) ,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20 ),
          ),
        ),
      ),
    );
  }
}