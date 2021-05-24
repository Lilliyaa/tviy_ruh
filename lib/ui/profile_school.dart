import 'package:flutter/material.dart';
import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter_apptest/model/provider.dart';
import 'package:flutter_apptest/theme.dart';


class ProfileSchool extends StatefulWidget {
  Provider provider;

  ProfileSchool(this.provider);

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
                    "http://" +
                        Strings.baseUrl +
                        "/avatars/" +
                    widget.provider.avatar,
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
              Text(widget.provider.name,
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
              Container(
                width: MediaQuery.of(context).size.width*0.7,
                child: Text(widget.provider.address,
                    style: Theme.of(context).textTheme.headline2),
              )
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
              Text(widget.provider.contact,
                  style: Theme.of(context).textTheme.headline2),
            ],
          ),
          SizedBox(height: 20,),

      ],
  ));
}