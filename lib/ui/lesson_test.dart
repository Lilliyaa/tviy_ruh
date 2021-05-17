
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/model/answer.dart';
import 'package:flutter_apptest/model/question.dart';
import 'package:flutter_apptest/model/test.dart';
import 'package:flutter_apptest/services/rest_api.dart';



class LessonTest extends StatefulWidget{
  int id;

  LessonTest(this.id){}

  @override
  _LessonTestState createState() => _LessonTestState();
}

class _LessonTestState extends State<LessonTest>{
  Test _test;
  List<Container> progressBoxes = [];
  int _currentQuestion = 0;

  String colorGroupValue = '';

  @override
  void initState(){
    _test = new Test();
    _test.id = 1;

    var answer1 = new Answer();
    answer1.text = "first";
    answer1.id = 2;
    var answer2 = new Answer();
    answer2.text = "second";
    answer2.id = 3;
    var answer3 = new Answer();
    answer3.text = "third";
    answer3.id = 4;

    var question1 = new Question();
    question1.id = 1;
    question1.text = "First1";
    question1.rightAnswerIndex = 0;
    question1.answers = [answer1, answer2, answer3];
    var question2 = new Question();
    question2.id = 1;
    question2.text = "First2";
    question2.rightAnswerIndex = 0;
    question2.answers = [answer1, answer2, answer3];
    var question3 = new Question();
    question3.id = 1;
    question3.text = "First3";
    question3.rightAnswerIndex = 0;
    question3.answers = [answer1, answer2, answer3];

    _test.questions = [question1, question2, question3];

    int i = 0;
    while (i<_test.questions.length){
      var box = new Container(
          decoration: BoxDecoration(
              color: Colors.green)/*
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: new Center(
            child: new Text("Rounded Corner Rectangle Shape",
              style: TextStyle(color: Colors.white, fontSize: 22),
              textAlign: TextAlign.center,),
          )*/
      );
      progressBoxes.add(box);
    }

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
               /* child: FutureBuilder<Test>(
                    future: _test,
                    builder: (context, snapshot){
                      if(snapshot.hasData){*/
                        child: new Column(
                          children: [
                            Row(children: progressBoxes),
                            Container(margin: EdgeInsets.only(bottom: 15.0),
                              child:  Text ("Кому дозволено рух у даній ситуації?Кому"
                                  " дозволено рух у даній ситуації?Кому дозволено рух у даній ситуації?",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                            RadioGroup(_test.questions[_currentQuestion]),
                            /*Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child:  Row(
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
                            ),*/
                          ],
                        )
                        /*  ListView.builder(
                      itemBuilder: (BuildContext context, int index, ){
                        return new StuffInTiles(context, toTiles(snapshot.data)[index], snapshot.data[index]);
                      },
                      itemCount: snapshot.data.length,
                      padding: EdgeInsets.only(left: 16, right: 15),
                    );*/
                     /* } else{
                        return Center(
                            child: CircularProgressIndicator()
                        );
                      }*/
                )
            )

    );
  }

}

class RadioGroup extends StatefulWidget {

  Question question;

  RadioGroup(this.question){}
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class RadioGroupWidget extends State<RadioGroup> {
  // Default Radio Button Item
  String radioItem = 'Mango';

  // Group Value for Radio Button.
  int id = 1;

  Widget build(BuildContext context) {
    return  SizedBox(
        height: 400,
        child: Column(
      children: <Widget>[
        Padding(
            padding : EdgeInsets.all(14.0),
            child: Text('$radioItem', style: TextStyle(fontSize: 23))
        ),

        Expanded(
            child: Container(
              height: 350.0,
              child: Column(
                children:
                widget.question.answers.map((data) => RadioListTile(
                  title: Text(data.text),
                  groupValue: id,
                  value: data.id,
                  onChanged: (val) {
                    setState(() {
                      radioItem = data.text ;
                      id = data.id;
                    });
                  },
                )).toList(),
              ),
            )),
      ],
        )
    );
  }
}

