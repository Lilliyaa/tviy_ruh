import 'package:flutter/material.dart';
import 'package:flutter_apptest/assets/nav_icons.dart';
import 'package:flutter_apptest/model/paragraph.dart';

import 'lesson_test.dart';
import 'lesson_text.dart';
import 'lesson_video.dart';

class LessonScreen extends StatefulWidget{
  int _selectedIndex;
  final Paragraph paragraph;
  List<Widget> _widgetOptions;

  LessonScreen (this.paragraph, this._selectedIndex){
    _widgetOptions = <Widget>[
      LessonText(paragraph.id),
      LessonVideo(paragraph.video),
      LessonTest(),
    ];
  }

  @override
  _MySecondScreenState createState() => _MySecondScreenState();
}

class _MySecondScreenState extends State<LessonScreen>{

  void _back(){
    setState(() {
      if(widget._selectedIndex>0) {
        widget._selectedIndex--;
      }
    });
  }

  void _ahead(){
    setState(() {
      if(widget._selectedIndex<2) {
        widget._selectedIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.paragraph.name),
          leading: new IconButton(
            icon: Icon(NavIcons.nav_row_left),
            color: Theme.of(context).bottomAppBarColor,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: widget._widgetOptions.elementAt(widget._selectedIndex),
        floatingActionButton: new Theme(
              data: new ThemeData(
                accentColor: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 50.0,
                        height: 20.0,
                        child: new FloatingActionButton(
                          heroTag: "btn1",
                          tooltip: 'Increment',
                          foregroundColor:  Color(0xfffebb57), // Colors.white,
                          elevation: 0.0,
                          child: Transform.scale(
                            scale: 1.5,
                            child: Icon(NavIcons.nav_row_left),
                          ),
                          onPressed: _back,
                        ),
                      ),
                      SizedBox(
                        width: 200.0,
                        height: 0,
                        child: Text(""),
                      ),
                      Container(
                        width: 10.0,
                        height: 20.0,
                        child: new FloatingActionButton(
                          heroTag: "btn2",
                          tooltip: 'Increment',
                          foregroundColor:  Color(0xfffebb57), // Colors.white,
                          elevation: 0.0,
                          child: Transform.scale(
                            scale: 1.5,
                            child: Icon(NavIcons.nav_row_right),
                          ),
                          onPressed: _ahead,
                        ),
                      )
                    ],
                  )
          ),
    );
  }
}