import 'package:flutter/material.dart';
import 'package:flutter_apptest/Nav.dart';

import 'ui/theme.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Bottom Nav Bar",
      home: Nav(),
    );
  }
}