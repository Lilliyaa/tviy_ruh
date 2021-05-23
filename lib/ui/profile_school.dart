import 'package:flutter/material.dart';
import 'package:flutter_apptest/theme.dart';

class DataFormDB{
  String name;
  String geo;
  String phone;
  String mail;
  String site;
  String image;
}

//Глобальные
DataFormDB _data = new DataFormDB();


class ProfileSchool extends StatefulWidget {
  ProfileSchool()
  {
    _data.name = "Форсаж";
    _data.mail = "forsage@gmail.com";
    _data.geo = "Харків, Держпром 5";
    _data.phone = "+3800664722947";
    _data.site = "ForsageSchool.com";
    _data.mail = "forsage@gmail.com";
    _data.image = "";
  }

  @override
  _ProfileSchoolState createState() => _ProfileSchoolState();
}



class _ProfileSchoolState extends State<ProfileSchool> {
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

      children:
        <Widget>[
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
                  Icons.directions_car_rounded,
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
                  Icons.link_outlined,
                  color: Color.fromRGBO(142, 140, 140, 1)),
              SizedBox(width: 30,),
              Text(_data.site,
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
      ],
  ));
}