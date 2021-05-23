import 'package:flutter/material.dart';
import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter_apptest/model/Users/UserStudent.dart';
import 'package:flutter_apptest/theme.dart';



class ProfileUser extends StatefulWidget {

  UserStudent userStudent;
  ProfileUser(this.userStudent);

  @override
  _ProfileUserState createState() => _ProfileUserState();
}



class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: myLightTheme.primaryColor,
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        "Профіль",
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      //backgroundColor: Color(0xfffebb57),
    ),
    body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: <Widget>[
        Container(
          height: 250,
          width: 200,
          child: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                  "http://" +
                      Strings.baseUrl +
                      "/avatars/" +
                  widget.userStudent.avatar,
                  height: 200,
                  width: 250,
                  fit: BoxFit.fill),
            ),
            radius: 50,
          ),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Icon(
                Icons.person,
                color: Color.fromRGBO(142, 140, 140, 1)),
            SizedBox(width: 30,),
            Text(widget.userStudent.name,
                style: Theme.of(context).textTheme.headline2),],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.mail_outline,
              color: Color.fromRGBO(142, 140, 140, 1)),
            SizedBox(width: 30,),
            Text(widget.userStudent.email,
            style: Theme.of(context).textTheme.headline2),
          ],
        ),
      ],

    ),
  );
}