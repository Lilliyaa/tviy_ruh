import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import 'package:flutter_apptest/theme.dart';

import 'home_screen.dart';
import 'lessons_screen.dart';
import 'map_screen.dart';

class Nav extends StatefulWidget{
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav>{
  int _selectedIndex = 0;
   String text = "bar";
   // Вот сюда вписіваем странички, которіе будут открываться в навигации, вместо Text("ololo")
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    myMap(),
    Text('Profile'),
    Lessons(),
    Text('Profile'),
  ];
  List<String> _screen_names = <String>[
    "Пошук",
    "Розпізнавання знаку",
    "Екзаменаційні білети",
    "Заняття",
    "Додатково"
  ];

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
      text = _screen_names[index];
    });
  }
  @override Widget build (BuildContext context){

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          text,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        //backgroundColor: Color(0xfffebb57),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:
      BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.car_repair,
              color: Colors.green,),
            title: Text('')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.home,
              color: Colors.green,),
            title: Text('')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.home,
              color: Colors.green,),
            title: Text('')
        ),
        BottomNavigationBarItem(
            icon: Icon(
                Icons.home,
              color: Colors.green,),
            title: Text('')
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.green,
            ),
            title: Text('')
        ),
      ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}