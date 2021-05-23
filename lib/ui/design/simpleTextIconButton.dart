import 'package:flutter/material.dart';

class SimpleTextIconButton extends StatelessWidget {
  final String text;
  final Function press;
  final Icon icon;

  const SimpleTextIconButton({
    Key key,
    this.text,
    this.press,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(252, 243, 227, 1),
            onPrimary: Colors.grey,
            shadowColor: Colors.grey,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 70),
          ),
          label: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: icon,
          onPressed: press
        ));
  }
}