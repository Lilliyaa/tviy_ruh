import 'package:flutter/material.dart';
import 'package:flutter_apptest/ui/welcome_screen_Components/registration.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter_apptest/ui/welcome_screen_Components/round_btn.dart';

class WelcomeBody extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(

      margin: EdgeInsets.symmetric(vertical: 100),
      height: size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Ласкаво просимо до \"Твій рух\"",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 25 ),
        ),
          SizedBox(height: size.height*0.5),
          RoundedButton(
            text: "Увійти в профіль",
            press: (){},
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
                      return RegistrationScreen();
                    }
                  )
              );
            },
          )
        ],
      ),
    );
  }
}



