import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_apptest/ui/welcome_screen_Components/body_reg.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import 'Nav.dart';
import 'welcome_screen.dart';

class WidgetTree extends StatefulWidget {
  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  User user;

  @override
  void initState(){

    super.initState();
        //onRefresh(FirebaseAuth.instance.currentUser);
  }

  onRefresh(userCred) {
    setState(() {
      user = userCred;
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    if (user == null) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          //добавлено. Не знаю, что это значит
          theme: myLightTheme,
          home: Body(
            onSignIn: (userCred) => onRefresh(userCred),
          ));
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false, //добавлено. Не знаю, что это значит
        theme: myLightTheme,
        home: Nav());
  }
}
