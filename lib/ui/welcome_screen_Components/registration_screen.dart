import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/services/authentification.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../Nav.dart';
import 'design/round_btn.dart';
import 'design/rounded_input_field.dart';

class Registration extends StatefulWidget {
  final Widget child;
  final Function(User) onSignIn;

  const Registration({
    Key key,
    @required this.child,
    @required this.onSignIn
  }) :super (key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  String _email = "jkhjk";
  String _password = "jhjhgj";
  String _error = "";

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          drawer: Drawer(),
          appBar: MyCustomAppBar(
            height: 100,
          ),
          body: Container(
            //margin: EdgeInsets.symmetric(vertical: 100),
            height: size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /*    RoundedInputField(
                hintText: "Прізвище",
                onChanged: (value){} ,
              ),
              RoundedInputField(
                hintText: "Ім'я",
                  icon: Icons.accessibility,
                onChanged: (value){} ,
              ),  RoundedInputField(
                hintText: "Телефон",
                icon: Icons.add_ic_call,
                onChanged: (value){} ,
              ),*/
                RoundedInputField(
                  hintText: "Електронна адреса",
                  icon: Icons.alternate_email_rounded,
                  onChanged: (value){
                    setState(() {
                      _email = value;
                    });
                  } ,
                ),
                RoundPassword(onChanged: (value){
                  setState(() {
                    _password = "Fsdfsdf";
                  });
                },),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child:Text(
                    (_error!=null? _error : "m5mm"),
                  style: Theme.of(context).textTheme.headline4),
                ),
                RoundedButton(
                  text: "Зареєструватися",
                  press: (){
                    signInWithEmail();
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context){
                            return Nav();
                          }
                      )
                  );*/
                  },
                ),
                SizedBox(height: size.height*0.01),
                OrDivider(),
                ElevatedButton(
                  onPressed: signInWithGoogle,
                  child: Text("Google"),
                ),
                ElevatedButton(
                  onPressed: signInAnonim,
                  child: Text("Anonim"),
                ),
                ElevatedButton(
                  onPressed: signInWithFacebook,
                  child: Text("Facebook"),
                ),
              ],
            ),
          )
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    await Authentification().signInWithGoogle();
  }

  Future<void> signInWithEmail() async {
    await Authentification().signInWithEmail("liliia.korotina@nure.ua", "Ura702fevrala");
  }

  Future<void> signInAnonim() async {
    UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
    //widget.onSignIn(userCredential.user);
  }

  // Future<void> signInWithEmail() async {
  //   try {
  //     if (true) {
  //       UserCredential userCredential = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(email: _email, password: _password);
  //       widget.onSignIn(userCredential.user);
  //     }
  //   } on Exception catch(e){
  //     setState(() {
  //       _error = e.toString();
  //     });
  //   }
  // }

  Future<void> signInWithFacebook() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final FacebookLoginResult result =
    await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');

        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

}

class OrDivider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width*0.8,
        child: Row(
          children: <Widget>[
            Expanded(child:
            Divider(color: Color.fromRGBO(139, 103, 46, 1),
              height: 1.5,)
            ),
            Text("АБО",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(139, 103, 46, 1),
                fontWeight: FontWeight.w600,
              ),),
            Expanded(child:
            Divider(color: Color.fromRGBO(139, 103, 46, 1),
              height: 1.5,)
            ),
          ],
        )
    );
  }
}

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color.fromRGBO(254, 187, 87, 1),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text("Швидка реєстрація",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 20 ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}