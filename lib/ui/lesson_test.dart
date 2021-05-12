
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/model/paragraph.dart';
import 'package:flutter_apptest/services/rest_api.dart';


class LessonTest extends StatefulWidget{

  @override
  _LessonTestState createState() => _LessonTestState();
}

class _LessonTestState extends State<LessonTest>{
  Future<List<Paragraph>> _lessons;
  String colorGroupValue = '';

  @override
  void initState(){
    _lessons = APIManager.getLessonsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
            color: Theme.of(context).primaryColor,
            child: SingleChildScrollView(
                padding: EdgeInsets.all(15.0),
                child: FutureBuilder<List<Paragraph>>(
                    future: _lessons,
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        return new Column(
                          children: [
                            Container(margin: EdgeInsets.only(bottom: 15.0),
                              child:  Text ("Кому дозволено рух у даній ситуації?Кому"
                                  " дозволено рух у даній ситуації?Кому дозволено рух у даній ситуації?",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                children: [
                                  Radio(
                                      value: 'blue',
                                      groupValue: colorGroupValue,
                                      onChanged: (val){
                                        colorGroupValue = val;
                                        setState((){});
                                      }
                                  ),
                                  Text('blue')
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child:
                                Row(
                                  children: [
                                    Radio(
                                        value: 'green',
                                        groupValue: colorGroupValue,
                                        onChanged: (val){
                                          colorGroupValue = val;
                                          setState((){});
                                        }
                                    ),
                                    Text('green')
                                  ],
                                )
                            ),
                          ],
                        );
                        /*  ListView.builder(
                      itemBuilder: (BuildContext context, int index, ){
                        return new StuffInTiles(context, toTiles(snapshot.data)[index], snapshot.data[index]);
                      },
                      itemCount: snapshot.data.length,
                      padding: EdgeInsets.only(left: 16, right: 15),
                    );*/
                      } else{
                        return Center(
                            child: CircularProgressIndicator()
                        );
                      }
                    }
                )
            )
        )
    );
  }
}


