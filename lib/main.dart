
import 'package:flutter/material.dart';
import 'package:flutter_apptest/theme.dart';
import 'ui/Nav.dart';
import 'ui/welcome_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  MyApp(){}
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      
      debugShowCheckedModeBanner: false, //добавлено. Не знаю, что это значит
      theme: myLightTheme,
      title: "Добро пожаловать в \"Твій рух\"",
      //title: "Bottom Nav Bar",
      //home: Nav(),
      home: WelcomeScreen(),
    );
  }
}