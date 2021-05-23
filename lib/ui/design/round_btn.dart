import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final double width;
  final Function press;
  final Color color, textColor;
  final double horPadding;
  final double verPadding;
  final fontSize;
  const RoundedButton({
    Key key,
    this.horPadding,
    this.verPadding,
    this.width,
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
      width: width==null? size.width *0.8 : width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical:verPadding==null? 20 : verPadding, horizontal: horPadding==null? 80 : horPadding),
          color: color!=null? color : Color.fromRGBO(254, 187, 87, 1) ,
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