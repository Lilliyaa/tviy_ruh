
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter_apptest/model/my_tile.dart';
import 'package:flutter_apptest/model/paragraph.dart';
import 'package:flutter_apptest/model/stuff_in_tiles.dart';
import 'package:flutter_apptest/services/rest_api.dart';


class Lessons extends StatefulWidget{

  @override
  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons>{
  Future<List<Paragraph>> _lessons;

  @override
  void initState(){
    _lessons = APIManager.getLessonsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
            child: FutureBuilder<List<Paragraph>>(
                future: _lessons,
                builder: (context, snapshot){
                  if(snapshot.hasData){
                  return new ListView.builder(
                    itemBuilder: (BuildContext context, int index, ){
                      return new StuffInTiles(context, toTiles(snapshot.data)[index], snapshot.data[index]);
                    },
                    itemCount: snapshot.data.length,
                    padding: EdgeInsets.only(left: 15, right: 15),
                  );
                  } else{
                    return Center(
                        child: CircularProgressIndicator()
                    );
                  }
                }

            )
        )
    );
  }
  List<MyTile> toTiles(List<Paragraph> lessons) {
    List<MyTile> tiles= [];
    for(var lesson in lessons){
      var tile = new MyTile(lesson.name, -1, <MyTile>[
        new MyTile(Strings.lesson, 0),
        new MyTile(Strings.video, 1),
        new MyTile(Strings.test, 2),
      ]);
      tiles.add(tile);
    }
    return tiles;
  }
}


