import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter_apptest/model/tiles/my_tile.dart';
import 'package:flutter_apptest/model/paragraph.dart';
import 'package:flutter_apptest/model/tiles/stuff_in_tiles.dart';
import 'package:flutter_apptest/services/authentification.dart';
import 'package:flutter_apptest/services/rest_api.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Lessons extends StatefulWidget {
  @override
  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  FlutterLocalNotificationsPlugin localNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  Future<List<Paragraph>> _lessons;
  String _email;

  void update(){
    setState(() {
      _lessons = APIManager.getLessonsData(_email);
    });
    _showNotofocation();
  }

  @override
  void initState() {
    _email = Authentification().getCurrentEmail();
    _lessons = APIManager.getLessonsData(_email);
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('ic_launcher');
    var IOSInialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
      android: androidInitialize, iOS: IOSInialize
    );
    localNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Theme.of(context).primaryColor,
            child: FutureBuilder<List<Paragraph>>(
                future: _lessons,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return new ListView.builder(
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        return new StuffInTiles(
                            context,
                            (snapshot.data[index].doneQuestions*100 /
                                    snapshot.data[index].allQuestions)
                                .toInt(),
                            toTiles(snapshot.data)[index],
                            snapshot.data[index],
                        update);
                      },
                      itemCount: snapshot.data.length,
                      padding: EdgeInsets.only(left: 16, right: 15),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }

  List<MyTile> toTiles(List<Paragraph> lessons) {
    List<MyTile> tiles = [];
    for (var lesson in lessons) {
      var tile = new MyTile(lesson.name, 100, -1, <MyTile>[
        new MyTile(Strings.lesson, -1, 0),
        new MyTile(Strings.video, -1, 1),
        new MyTile(Strings.test, -1, 2),
      ]);
      tiles.add(tile);
    }
    return tiles;
  }

  Future _showNotofocation() async{
    var andDroidDetails = new AndroidNotificationDetails("channelId", "Local Notofication", "Description");
    var iosDetails = new IOSNotificationDetails();
    var general = new NotificationDetails(android: andDroidDetails, iOS: iosDetails);
    await localNotificationsPlugin.show(0, "Який ти сьогодні розумний!", "Скоріше поділись результатом з друзями", general);
  }
}
