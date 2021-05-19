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
      LessonTest(paragraph.id),
    ];
  }

  @override
  _MySecondScreenState createState() => _MySecondScreenState();
}

class _MySecondScreenState extends State<LessonScreen>{
  bool _leftArrowVisible;
  bool _rightArrowVisible;

  void _setVisibility(){
    if (widget._selectedIndex == 0){
      _leftArrowVisible = false;
      _rightArrowVisible = true;
    } else if(widget._selectedIndex == 2){
      _leftArrowVisible = true;
      _rightArrowVisible = false;
    } else{
      _leftArrowVisible = true;
      _rightArrowVisible = true;
    }
  }

  void _back(){

    setState(() {
      if(widget._selectedIndex>0) {
        widget._selectedIndex--;
      }
      _setVisibility();
    });
  }

  void _ahead(){

    setState(() {
      if(widget._selectedIndex<2) {
        widget._selectedIndex++;
      }
      _setVisibility();
    });
  }
  @override
  void initState() {
    _setVisibility();
    super.initState();
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Visibility (
                          visible: _leftArrowVisible,
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
                        )
                      ),
                      Container(
                        child: Visibility (
                        visible: _rightArrowVisible,
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
                      )
                    ],
                  )
          ),
    );
  }
}