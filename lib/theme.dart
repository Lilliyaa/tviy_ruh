import 'package:flutter/material.dart';

ThemeData myLightTheme = ThemeData(
    primaryColor: Color.fromRGBO(252, 243, 227, 1),
    bottomAppBarColor: Color(0xff4b4a4a),

    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),

      bodyText1: TextStyle(fontSize: 16.0, fontFamily: 'Roboto', color: Color(0xff4b4a4a)
      ),

      //for question`s text
      bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Roboto', color: Colors.black, shadows: <Shadow>[
        Shadow(
          offset: Offset(2.0, 2.0),
          blurRadius: 3.0,
          color:Color.fromRGBO(140, 140, 140, 0.5),
        ),
      ],
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(254, 187, 87, 1),
      titleTextStyle: TextStyle(
        color: Color(0xff4b4a4a),
        fontSize: 22,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w500,
      ),
      //color: Color.fromRGBO(254, 187, 87, 0)
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Color.fromRGBO(140, 140, 140, 1),
      selectedItemColor: Colors.white,
      backgroundColor: Color(0xff4b4a4a),
      type: BottomNavigationBarType.fixed,
    )

);