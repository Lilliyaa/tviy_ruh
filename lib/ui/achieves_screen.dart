
import 'package:flutter/material.dart';
import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter_apptest/model/achieve.dart';
import 'package:flutter_apptest/services/rest_api.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Achieves extends StatefulWidget {
  @override
  _AchievesState createState() => _AchievesState();
}

class _AchievesState extends State<Achieves> {
  final Future<List<Achieve>> _achieves = APIManager.selectAchieves(1);

  int countOpen(value) {
    int res = 0;
    for (var achieve in value) {
      if (achieve.progress == 100) {
        res++;
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Ачівки",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Container(
        //color: Colors.black12,
        child: FutureBuilder(
            future: _achieves,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Achieve> nAchieves = snapshot.data ?? [];
                return ListView(
                  children: [
                    Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 20),
                        child: Image.asset("assets/images/Ach_embl.png")
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Відкрито ${countOpen(nAchieves)} з ${nAchieves.length} нагород",
                        style: TextStyle(
                          color: Color.fromRGBO(122, 120, 120, 1),
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      //color: Colors.black12,
                        margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                        alignment: Alignment.topCenter,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            spacing: 15,
                            runSpacing: 10,
                            children: nAchieves.map((e) => AchieveIco(e)).toList(),
                          ),
                        )
                    ),
                  ],
                );
              }
              else {
                return Center(
                    child: CircularProgressIndicator()
                );
              }
            }
        ),
      ),
    );
  }
}

class AchieveIco extends StatelessWidget {
  //const AchieveIco({Key key}) : super(key: key);

  final Achieve _achieve;

  const AchieveIco(this._achieve) :super();

  Map<String, Color> getColors(String basicColor){
    Map<String, Color> map;
    switch(basicColor){
      case "red":
        map = {
          "icon": Color.fromRGBO(163, 100, 100, 1),
          "background": Color.fromRGBO(237, 137, 137, 1),
          "border": Color.fromRGBO(255, 200, 200, 1),
        };
        break;
      case "yellow":
        map = {
          "icon": Color.fromRGBO(160, 147, 25, 1),
          "background": Color.fromRGBO(246, 231, 94, 1),
          "border": Color.fromRGBO(255, 246, 159, 1),
        };
        break;
      case "green":
        map = {
          "icon": Color.fromRGBO(105, 153, 92, 1),
          "background": Color.fromRGBO(161, 221, 145, 1),
          "border": Color.fromRGBO(220, 255, 210, 1),
        };
        break;
      case "purple":
        map = {
          "icon": Color.fromRGBO(137, 107, 161, 1),
          "background": Color.fromRGBO(203, 159, 238, 1),
          "border": Color.fromRGBO(236, 211, 255, 1),
        };
        break;
      case "blue":
        map = {
          "icon": Color.fromRGBO(72, 153, 171, 1),
          "background": Color.fromRGBO(122, 215, 236, 1),
          "border": Color.fromRGBO(187, 243, 255, 1),
        };
        break;
      default:
        map = {
          "icon": Color.fromRGBO(84, 84, 84, 1),
          "background": Color.fromRGBO(148, 148, 148, 1),
          "border": Color.fromRGBO(211, 211, 211, 1),
        };
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    var colorTheme = getColors(_achieve.color);
    String iconPath = "empty.png";
    if(_achieve.progress == 100){
      iconPath = _achieve.icon;
    }
    GestureDetector(onTap: (){

    }
    return  Container(
      child: Image.network(
        "http://" + Strings.baseUrl + "/achieves/" + iconPath,
        //color: colorTheme['icon'],
      ),
      alignment: Alignment.center,
      height: 67,
      width: 67,
      decoration: BoxDecoration(
        color: colorTheme['background'],
        shape: BoxShape.circle,
        border: Border.all(
          color: colorTheme['border'],
          style: BorderStyle.solid,
          width: 5,
        ),
      ),
    ),
    );
  }
}


/*
_achivestup(int paragraphId) async {
    await Future.delayed(Duration(milliseconds: 100));
    showDialog(

        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: Text(
              "За успіхи!",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            content: Text(
              "Ви пройшли 50% тестів ",

              style: Theme.of(context).textTheme.bodyText1,
            ),


          );
        });*/
