import 'package:flutter/material.dart';
import 'file:///C:/Users/Swilli/AndroidStudioProjects/flutter_apptest/lib/ui/lesson_text.dart';
import 'file:///C:/Users/Swilli/AndroidStudioProjects/flutter_apptest/lib/ui/lesson_video.dart';

class SecondScreen extends StatefulWidget{
  SecondScreen (this.name, this.text){
    _widgetOptions = <Widget>[
      lesson_text(text),
      lesson_video(

      ),
      // Lesson_test(),
    ];
  }
  String name;
  String text;
  List<Widget> _widgetOptions;

  @override
  _MySecondScreenState createState() => _MySecondScreenState();
}

class _MySecondScreenState extends State<SecondScreen>{
  int _selectedIndex = 0;
  void _onItemTap(){
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
        title: Text(widget.name),
      ),
      body: widget._widgetOptions.elementAt(_selectedIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: new Theme(
          data: new ThemeData(
            accentColor: Colors.transparent,
          ),
          child: SizedBox.expand(
              child: Row(
                children: [
                  new FloatingActionButton(
                    tooltip: 'Increment',
                    foregroundColor:  Color(0xfffebb57), // Colors.white,
                    elevation: 0.0,
                    child: new Icon(Icons.arrow_left),
                  ),
                  new FloatingActionButton(
                    tooltip: 'Increment',
                    foregroundColor:  Color(0xfffebb57), // Colors.white,
                    elevation: 0.0,
                    child: new Icon(Icons.arrow_right),
                    onPressed: _onItemTap,
                  ),
                ],
              )
          )
      ),
    );
  }
}