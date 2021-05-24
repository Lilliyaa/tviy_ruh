import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/services/authentification.dart';
import 'package:flutter_apptest/services/rest_api.dart';
import 'package:flutter_apptest/ui/design/devider.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:intl/date_symbol_data_local.dart';


import '../design/round_btn.dart';
import '../design/rounded_input_field.dart';

class RegistrationStudent extends StatefulWidget {
  final Widget child;
  final Function(User) onSignIn;

  const RegistrationStudent(
      {Key key, @required this.child, @required this.onSignIn})
      : super(key: key);

  @override
  _RegistrationStudentState createState() => _RegistrationStudentState();
}

class _RegistrationStudentState extends State<RegistrationStudent> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  String _name;
  String _surname;
  String _email;
  String _password;
  String _confirmPassword;
  String _error = "";

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Реєстрація"),
          ),
          body: Container(
            height: size.height,
            width: double.infinity,
            child: ListView (
            padding: EdgeInsets.only(left: 20, right: 20, top: 100),

              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedInputField(
                  hintText: "Ім'я",
                  icon: Icons.accessibility,
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                RoundedInputField(
                  hintText: "Прізвище",
                  onChanged: (value) {
                    setState(() {
                      _surname = value;
                    });
                  },
                ),
                RoundedInputField(
                  hintText: "Електронна адреса",
                  icon: Icons.alternate_email_rounded,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                RoundPassword(
                  text: "Пароль",
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                RoundPassword(
                  text: "Підтвердження паролю",
                  onChanged: (value) {
                    setState(() {
                      _confirmPassword = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text((_error != null ? _error : "Заповніть поля"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontFamily: "Roboto",
                        fontSize: 16,
                        shadows: [],
                      )),
                ),
                RoundedButton(
                  text: "Зареєструватися",
                  press: () {
                    if (checkDataEmail()) {
                      setState(() {
                        _error = "";
                      });
                      createUserWithEmail();
                    }
                  },
                ),
                SizedBox(height: size.height * 0.01),
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: SizedBox(
                          height: 70,
                          width: 70,
                          child: FlatButton(
                              onPressed: () {
                                if (checkDataGoogleAndFB()) {
                                  setState(() {
                                    _error = "";
                                  });
                                  createUserWithGoogle();
                                }
                              },
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
                              onPressed: () {
                                if (checkDataGoogleAndFB()) {
                                  setState(() {
                                    _error = "";
                                  });
                                  createUserWithFacebook();
                                }
                              },
                              padding: EdgeInsets.all(0.0),
                              child:
                              Image.asset('assets/images/facebook.png'))),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }



  Future<void> createUserWithEmail() async {
    List response =
    await Authentification().createUserWithEmail(_email, _password);
    User user = response[0];
    if (user != null) {
      APIManager.addUserStudent(_name, _surname, _email);
      Navigator.of(context).pop(true);
      Navigator.of(context).pop(true);
    } else {
      setState(() {
        switch (response[1]) {
          case "The email address is badly formatted.":
            _error = "Не коректна адреса пошти";
            break;
          case "Password should be at least 6 characters":
            _error = "Пароль повинен бути довше 6 символів";
            break;
          case "The email address is already in use by another account.":
            _error = "Ця пошта вже використовується";
            break;
          default:
            _error = response[1];
        }
      });
    }
  }


  bool checkDataEmail() {
    if (_name == "" || _name == null) {
      setState(() {
        _error = "Введіть ім'я";
      });
      return false;
    } else if (_surname == "" || _surname == null) {
      setState(() {
        _error = "Введіть прізвище";
      });
      return false;
    } else if (_email == "" || _email == null) {
      setState(() {
        _error = "Введіть пошту";
      });
      return false;
    } else if (_password == "" || _password == null) {
      setState(() {
        _error = "Введіть пароль";
      });
      return false;
    } else if (_confirmPassword == "" || _confirmPassword == null) {
      setState(() {
        _error = "Підтвердіть пароль";
      });
      return false;
    } else if (_confirmPassword != _password) {
      setState(() {
        _error = "Паролі не співпадають";
      });
      return false;
    }
    return true;
  }

  bool checkDataGoogleAndFB() {
    if (_name == "" || _name == null) {
      setState(() {
        _error = "Введіть ім'я";
      });
      return false;
    } else if (_surname == "" || _surname == null) {
      setState(() {
        _error = "Введіть прізвище";
      });
      return false;
    }
    return true;
  }



  Future<void> createUserWithGoogle() async {
    User user  = await Authentification().signInWithGoogle();
    if(user!=null){
      APIManager.addUserStudent(_name, _surname, user.email);
      Navigator.of(context).pop(true);
      Navigator.of(context).pop(true);
    } else{
    }
  }


  Future<void> createUserWithFacebook() async {
    await Authentification().signInWithFacebook();
  }


}