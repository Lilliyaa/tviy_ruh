
import 'package:flutter/material.dart';
import 'package:flutter_apptest/theme.dart';
import 'ui/Nav.dart';
import 'ui/welcome_screen.dart';
import 'package:flutter_apptest/ui/statistic_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false, //добавлено. Не знаю, что это значит
      theme: myLightTheme,
      // title: "Добро пожаловать в \"Твій рух\"",
      title: "Bottom Nav Bar",
      home: Nav(),
      // home: Statistic(),
      // home: WelcomeScreen(),
    );
  }
}