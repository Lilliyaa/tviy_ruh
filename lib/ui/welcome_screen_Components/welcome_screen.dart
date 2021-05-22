import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/ui/welcome_screen_Components/logIn_screen.dart';

import 'design/round_btn.dart';
import 'registration_screen.dart';
//import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatefulWidget{
  final Function(User) onSignIn;

  const WelcomeScreen({
    Key key,
    @required this.onSignIn
  }) :super (key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 100),
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Ласкаво просимо!",
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: size.height*0.5),
            RoundedButton(
              text: "          Увійти          ",
              press: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context){
                          return LogIn();
                        }
                    )
                );
              },
            ),
            SizedBox(height: size.height*0.03),
            RoundedButton(
              text: "Зареєструватись",
              fontSize: 1,
              press: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context){
                          return Registration();
                        }
                    )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}



