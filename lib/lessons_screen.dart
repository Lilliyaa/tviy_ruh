import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_apptest/custom_expansion_tile.dart' as custom;
class Lessons extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return Container(
      color: Color(0xfffcf3e3),
      child:
      new ListView.builder( itemBuilder: (BuildContext context, int index, ){
        return new StuffInTiles(listOfTiles[index]);
      },
      itemCount: listOfTiles.length,
      ),
      padding: EdgeInsets.only(left: 15, right: 15),
    );


    // Figma Flutter Generator LessonsWidget - FRAME
      // Container(
      //   width: 360,
      //   height: 640,
      //   color: Color(0xfffcf3e3),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children:[
      //       Container(
      //         width: 360,
      //         height: 55,
      //         child: Row(
      //           mainAxisSize: MainAxisSize.min,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //         ),
      //       ),
      //       SizedBox(height: 3.50),
      //       Container(
      //         width: 342,
      //         height: 531,
      //         padding: const EdgeInsets.only(left: 1, ),
      //         child: Row(
      //           mainAxisSize: MainAxisSize.min,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.end,
      //           children:[
      //             Container(
      //               width: 342,
      //               height: double.infinity,
      //               padding: const EdgeInsets.only(right: 1, bottom: 15, ),
      //               child: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children:[
      //                   SizedBox(height: 12),
      //                   Container(
      //                     width: 340.36,
      //                     height: 38,
      //                     child: Stack(
      //                       children:[
      //                         Container(
      //                           width: 340.36,
      //                           height: 38,
      //                           decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.circular(15),
      //                             color: Colors.white,
      //                           ),
      //                           padding: const EdgeInsets.only(left: 306, right: 10, top: 12, bottom: 11, ),
      //                           child: Row(
      //                             mainAxisSize: MainAxisSize.min,
      //                             mainAxisAlignment: MainAxisAlignment.end,
      //                             crossAxisAlignment: CrossAxisAlignment.center,
      //                             children:[
      //                               Container(
      //                                 width: 24,
      //                                 height: 15,
      //                                 decoration: BoxDecoration(
      //                                   borderRadius: BorderRadius.circular(8),
      //                                   color: Color(0xff292929),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Positioned.fill(
      //                           child: Align(
      //                             alignment: Alignment.topLeft,
      //                             child: Container(
      //                               width: 340,
      //                               height: 45,
      //                               decoration: BoxDecoration(
      //                                 borderRadius: BorderRadius.circular(15),
      //                                 color: Colors.white,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         Positioned.fill(
      //                           child: Align(
      //                             alignment: Alignment.topLeft,
      //                             child: Container(
      //                               width: 37,
      //                               height: 27,
      //                               child: Stack(
      //                                 children:[
      //                                   Positioned.fill(
      //                                     child: Align(
      //                                       alignment: Alignment.topLeft,
      //                                       child: Container(
      //                                         width: 31,
      //                                         height: 31,
      //                                         decoration: BoxDecoration(
      //                                           shape: BoxShape.circle,
      //                                           border: Border.all(color: Color(0x00000000), width: 1, ),
      //                                           color: Color(0xffffa31a),
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ),
      //                                   Positioned.fill(
      //                                     child: Align(
      //                                       alignment: Alignment.bottomLeft,
      //                                       child: SizedBox(
      //                                         width: 32,
      //                                         height: 17,
      //                                         child: Text(
      //                                           "100%",
      //                                           textAlign: TextAlign.center,
      //                                           style: TextStyle(
      //                                             color: Color(0xff292929),
      //                                             fontSize: 10,
      //                                           ),
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         Positioned.fill(
      //                           child: Align(
      //                             alignment: Alignment.center,
      //                             child: SizedBox(
      //                               width: 271,
      //                               height: 38,
      //                               child: Text(
      //                                 "2. Обов'язки і права водіїв механічних транспортних засобів",
      //                                 style: TextStyle(
      //                                   color: Color(0xff292929),
      //                                   fontSize: 16,
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                   SizedBox(height: 12),
      //                   Container(
      //                     width: 340.36,
      //                     height: 38,
      //                     child: Stack(
      //                       children:[
      //                         Container(
      //                           width: 340.36,
      //                           height: 38,
      //                           decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.circular(15),
      //                             color: Colors.white,
      //                           ),
      //                           padding: const EdgeInsets.only(left: 306, right: 10, top: 12, bottom: 11, ),
      //                           child: Row(
      //                             mainAxisSize: MainAxisSize.min,
      //                             mainAxisAlignment: MainAxisAlignment.end,
      //                             crossAxisAlignment: CrossAxisAlignment.center,
      //                             children:[
      //                               Container(
      //                                 width: 24,
      //                                 height: 15,
      //                                 decoration: BoxDecoration(
      //                                   borderRadius: BorderRadius.circular(8),
      //                                   color: Color(0xff292929),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Positioned.fill(
      //                           child: Align(
      //                             alignment: Alignment.topLeft,
      //                             child: Container(
      //                               width: 340.36,
      //                               height: 40,
      //                               decoration: BoxDecoration(
      //                                 borderRadius: BorderRadius.circular(15),
      //                                 color: Colors.white,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         Positioned.fill(
      //                           child: Align(
      //                             alignment: Alignment.topLeft,
      //                             child: Container(
      //                               width: 37,
      //                               height: 27,
      //                               child: Stack(
      //                                 children:[
      //                                   Positioned.fill(
      //                                     child: Align(
      //                                       alignment: Alignment.topLeft,
      //                                       child: Container(
      //                                         width: 31,
      //                                         height: 31,
      //                                         decoration: BoxDecoration(
      //                                           shape: BoxShape.circle,
      //                                           border: Border.all(color: Color(0x00000000), width: 1, ),
      //                                           color: Color(0xffffa31a),
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ),
      //                                   Positioned.fill(
      //                                     child: Align(
      //                                       alignment: Alignment.bottomLeft,
      //                                       child: SizedBox(
      //                                         width: 32,
      //                                         height: 17,
      //                                         child: Text(
      //                                           "100%",
      //                                           textAlign: TextAlign.center,
      //                                           style: TextStyle(
      //                                             color: Color(0xff292929),
      //                                             fontSize: 10,
      //                                           ),
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         Positioned.fill(
      //                           child: Align(
      //                             alignment: Alignment.center,
      //                             child: SizedBox(
      //                               width: 272,
      //                               height: 38,
      //                               child: Text(
      //                                 "3. Рух транспортних засобів із спеціальними сигналами",
      //                                 style: TextStyle(
      //                                   color: Color(0xff595959),
      //                                   fontSize: 16,
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // );
  }
}

class MyTile{
  String title;
  List<MyTile> children;

  MyTile(this.title, [this.children = const <MyTile>[]]);
}


class StuffInTiles extends StatelessWidget {
  final MyTile myTile;

  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {

    if (t.children.isEmpty) {
      return new ListTile(
          title: new Text(t.title));
    }
    return new custom.ExpansionTile(
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

List<MyTile> listOfTiles = <MyTile>[
  new MyTile ("Загальні положення", <MyTile>[
    new MyTile("Урок"),
    new MyTile("Відео"),
    new MyTile("Тест"),
  ]
  ),
  new MyTile ("Загальні положення2", <MyTile>[
    new MyTile("Урок"),
    new MyTile("Відео"),
    new MyTile("Тест"),
  ]
  ),
  new MyTile ("Загальні положення3", <MyTile>[
    new MyTile("Урок"),
    new MyTile("Відео"),
    new MyTile("Тест"),
  ]
  ),
  new MyTile ("Загальні положення3", <MyTile>[
    new MyTile("Урок"),
    new MyTile("Відео"),
    new MyTile("Тест"),
  ]
  ),
  new MyTile ("Загальні положення3", <MyTile>[
    new MyTile("Урок"),
    new MyTile("Відео"),
    new MyTile("Тест"),
  ]
  ),
  new MyTile ("Загальні положення3", <MyTile>[
    new MyTile("Урок"),
    new MyTile("Відео"),
    new MyTile("Тест"),
  ]
  ),
  new MyTile ("Загальні положення3", <MyTile>[
    new MyTile("Урок"),
    new MyTile("Відео"),
    new MyTile("Тест"),
  ]
  ),
  new MyTile ("Загальні положення3", <MyTile>[
    new MyTile("Урок"),
    new MyTile("Відео"),
    new MyTile("Тест"),
  ]
  ),
  new MyTile ("Загальні положення3", <MyTile>[
    new MyTile("Урок"),
    new MyTile("Відео"),
    new MyTile("Тест"),
  ]
  ),
  new MyTile ("Загальні положення3", <MyTile>[
    new MyTile("Урок"),
    new MyTile("Відео"),
    new MyTile("Тест"),
  ]
  ),
  new MyTile ("Загальні положення3", <MyTile>[
    new MyTile("Урок"),
    new MyTile("Відео"),
    new MyTile("Тест"),
  ]
  ),
  new MyTile ("Загальні положення3", <MyTile>[
    new MyTile("Урок"),
    new MyTile("Відео"),
    new MyTile("Тест"),
  ]
  ),
  MyTile ("Загальні положення3", <MyTile>[
    new MyTile("Урок"),
    new MyTile("Відео"),
    new MyTile("Тест"),
  ]
  ),
];



