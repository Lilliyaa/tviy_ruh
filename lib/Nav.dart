import 'package:flutter/material.dart';
import 'package:flutter_apptest/home_screen.dart';
import 'package:flutter_apptest/lessons_screen.dart';
import 'package:flutter_svg/svg.dart';

class Nav extends StatefulWidget{
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav>{
  int _selectedIndex = 0;
   String text = "bar";
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text('Messages'),
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
          style: TextStyle(
            color: Color(0xff4b4a4a),
            fontSize: 22,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Color(0xfffebb57),
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