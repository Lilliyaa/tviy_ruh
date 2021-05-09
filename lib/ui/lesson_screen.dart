import 'package:flutter/material.dart';
import 'package:flutter_apptest/assets/nav_icons.dart';
import 'package:flutter_apptest/model/paragraph.dart';
import 'package:flutter_apptest/ui/lesson_text.dart';

import 'lesson_video.dart';

class LessonScreen extends StatefulWidget{
  final Paragraph paragraph;
  List<Widget> _widgetOptions;

  LessonScreen (this.paragraph){
    _widgetOptions = <Widget>[
      LessonText(paragraph.id),
      LessonVideo(paragraph.video),
      // Lesson_test(),
    ];
  }

  @override
  _MySecondScreenState createState() => _MySecondScreenState();
}

class _MySecondScreenState extends State<LessonScreen>{
  int _selectedIndex = 0;

  void _back(){
    setState(() {
      if(_selectedIndex>0) {
        _selectedIndex--;
      }
    });
  }

  void _ahead(){
    setState(() {
      if(_selectedIndex<1) {
        _selectedIndex++;
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
        body: widget._widgetOptions.elementAt(_selectedIndex),
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