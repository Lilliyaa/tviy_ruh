import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(icon),
            hintText:hintText,
            border: InputBorder.none),
      ),
    );
  }
}

class RoundPassword extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String text;
  const RoundPassword({
    Key key,
    this.onChanged,
    this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
          hintText: text,
          icon: Icon(Icons.lock),
          suffixIcon: Icon(Icons.visibility),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Color.fromRGBO(254, 187, 87, 1),
          borderRadius: BorderRadius.circular((29),)
      ),
      child: child,
    );
  }
}