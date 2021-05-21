import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import 'Nav.dart';
import 'welcome_screen.dart';


class WidgetTree extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    if(user==null){
      return  MaterialApp(
          debugShowCheckedModeBanner: false, //добавлено. Не знаю, что это значит
          theme: myLightTheme,
          home: WelcomeScreen());
    }
    return  MaterialApp(
        debugShowCheckedModeBanner: false, //добавлено. Не знаю, что это значит
        theme: myLightTheme,
        home: Nav()
    );
  }
}