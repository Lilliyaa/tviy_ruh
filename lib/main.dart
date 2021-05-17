
import 'package:flutter/material.dart';
import 'package:flutter_apptest/theme.dart';
import 'ui/Nav.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: myLightTheme,
      title: "Bottom Nav Bar",
      home: Nav(),
    );
  }
}