import 'package:flutter/material.dart';

ThemeData basicTheme(){
  TextTheme _basicTextTheme(TextTheme base){
    return base.copyWith(
      headline: base.headline.copyWith(
        fontFamily: 'Roboto',
        fontSize: 25.0,
        color: Color.fromARGB(75, 75, 75, 100),
      ),
      title: base.title.copyWith(
        fontFamily: 'Roboto',
        fontSize: 25.0,
        color: Color.fromARGB(75, 75, 75, 100),
      ),
    );
  }

}