import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/services/authentification.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:flutter_apptest/ui/Nav.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'design/devider.dart';
import 'design/round_btn.dart';
import 'design/rounded_input_field.dart';

class LogIn extends StatefulWidget {
  final Function(User) onSignIn;

  const LogIn({
    Key key,
    @required this.onSignIn
  }) :super (key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String _email;
  String _password;
  String _error = "";

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text("Вхід"),
        ),
        body: Container(
          //margin: EdgeInsets.symmetric(vertical: 100),
          //height: size.height,
          //width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedInputField(
                hintText: "Електронна адреса",
                icon: Icons.alternate_email_rounded,
                onChanged: (value){
                  setState(() {
                    _email = value;
                  });
                } ,
              ),
              RoundPassword(
                text: "Пароль",
                onChanged: (value){
                  setState(() {
                    _password = value;
                  });
                },),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:Text(
                    (_error!=null? _error : "Заповніть поля"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontFamily: "Roboto",
                      fontSize: 16,
                      shadows: [],
                    )),
              ),
              RoundedButton(
                text: "Увійти",
                press: (){
                  signInWithEmail();
                },
              ),
              SizedBox(height: size.height*0.01),
              OrDivider(),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: SizedBox(
                        height: 70,
                        width: 70,
                        child: FlatButton(
                            onPressed: signInWithGoogle,
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/images/google.png'))),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    child: SizedBox(
                        height: 80,
                        width: 80,
                        child: FlatButton(
                            onPressed: signInWithFacebook,
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/images/facebook.png'))),
                  ),
                ],),
            ],
          ),
        )

    );
  }

  Future<void> signInWithGoogle() async {
    User user  = await Authentification().signInWithGoogle();
    if(user!=null){
      Navigator.of(context).pop(true);
    } else{
    }
  }

  Future<void> signInWithEmail() async {
    List response = await Authentification().signInWithEmail(_email, _password);
    User user = response[0];
    if(user!=null){
      Navigator.of(context).pop(true);
    } else{
      setState(() {
        switch(response[1]){
          case "The email address is badly formatted.":
            _error = "Не коректна адреса пошти";
            break;
          case "The password is invalid or the user does not have a password.":
            _error = "Не верний пароль. Можливо. ви реєструвались через Google або FaceBook?";
            break;
          case "There is no user record corresponding to this identifier. The user may have been deleted.":
            _error = "Пошта не зареєстрована";
            break;
          default:
            _error = response[1];
        }
      });
    }
  }

  Future<void> signInWithFacebook() async {
    await Authentification().signInWithFacebook();
  }

}
