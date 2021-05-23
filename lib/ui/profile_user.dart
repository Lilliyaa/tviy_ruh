import 'package:flutter/material.dart';
import 'package:flutter_apptest/theme.dart';

class DataFormDB{
  String name;
  String mail;
  String image;
}

//Глобальные
DataFormDB _data = new DataFormDB();


class ProfileUser extends StatefulWidget {
  ProfileUser()
  {
    _data.name = "Микола Хвильовий";
    _data.mail = "mikola.hvilyuvii@gmail.com";
    _data.image = "";
  }

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
                  _data.image,
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
            Text(_data.name,
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
            Text(_data.mail,
            style: Theme.of(context).textTheme.headline2),
          ],
        ),
      ],

    ),
  );
}