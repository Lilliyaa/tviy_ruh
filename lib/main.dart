
import 'package:flutter/material.dart';
import 'package:flutter_apptest/theme.dart';
import 'ui/Nav.dart';
import 'ui/welcome_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false, //добавлено. Не знаю, что это значит
      //theme: myLightTheme,
      theme: ThemeData(
          primaryColor: Color.fromRGBO(252, 243, 227, 1),
          scaffoldBackgroundColor: Color.fromRGBO(252, 243, 227, 1)),
      title: "Добро пожаловать в \"Твій рух\"",
      //title: "Bottom Nav Bar",
      //home: Nav(),
      home: WelcomeScreen(),
    );
  }
}