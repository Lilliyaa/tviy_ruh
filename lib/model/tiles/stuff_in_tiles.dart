import 'package:flutter/material.dart';
import 'package:flutter_apptest/model/paragraph.dart';
import 'package:flutter_apptest/ui/lesson_screen.dart';

import 'my_tile.dart';
import 'custom_expansion_tile.dart';

class StuffInTiles extends StatelessWidget  {
  final BuildContext context;
  final MyTile myTile;
  final Paragraph paragraph;
  final int progress;

  StuffInTiles(this.context, this.progress, this.myTile, this.paragraph);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty) {
      return new GestureDetector(
          onTap:() {
            if(t.type==0) {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    LessonScreen(paragraph, 0)),
              );
            } else if(t.type==1){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    LessonScreen(paragraph, 1)),
              );
            }else if(t.type==2){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    LessonScreen(paragraph, 2)),
              );
            }
          },
          child: new ListTile(
            title: new Text(t.title
            ),
          )
      );
    }
    return new CustomExpansionTile(
      backgroundColor: Colors.white,
      headerBackgroundColor: Colors.white,
      key: new PageStorageKey<MyTile>(t),
      title:  Text(
        t.title,
      ),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}