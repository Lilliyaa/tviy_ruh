import 'package:flutter/material.dart';
import 'package:flutter_apptest/theme.dart';

class DataFormDB{
  String name;
  String age;
  String sex;
  String geo;
  String phone;
  String mail;
  String car;
  String image;
}

//Глобальные
DataFormDB _data = new DataFormDB();


class ProfileCInstructor extends StatefulWidget {
  ProfileCInstructor()
  {
    _data.name = "Олександра Огурцова";
    _data.age = "18";
    _data.sex = "жіноча";
    _data.geo = "Харків, Новгороська 20А";
    _data.phone = "+380664722947";
    _data.mail = "olexa@gmail.com";
    _data.car = "Daewoo Lanos";
    _data.image = "";
  }

  @override
  _ProfileCInstructorState createState() => _ProfileCInstructorState();
}



class _ProfileCInstructorState extends State<ProfileCInstructor> {
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
                Icons.accessibility_new,
                color: Color.fromRGBO(142, 140, 140, 1)),
            SizedBox(width: 30,),
            Text(_data.age,
                style: Theme.of(context).textTheme.headline2),
          ],
        ),

        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
                Icons.account_circle,
                color: Color.fromRGBO(142, 140, 140, 1)),
            SizedBox(width: 30,),
            Text(_data.sex,
                style: Theme.of(context).textTheme.headline2),
          ],
        ),

        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
                Icons.add_location,
                color: Color.fromRGBO(142, 140, 140, 1)),
            SizedBox(width: 30,),
            Text(_data.geo,
                style: Theme.of(context).textTheme.headline2),
          ],
        ),

        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
                Icons.add_call,
                color: Color.fromRGBO(142, 140, 140, 1)),
            SizedBox(width: 30,),
            Text(_data.phone,
                style: Theme.of(context).textTheme.headline2),
          ],
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

        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
                Icons.directions_car_outlined,
                color: Color.fromRGBO(142, 140, 140, 1)),
            SizedBox(width: 30,),
            Text(_data.car,
                style: Theme.of(context).textTheme.headline2),
          ],
        ),
      ],

    ),
  );
}