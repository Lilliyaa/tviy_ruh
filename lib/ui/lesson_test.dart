
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/constants/strings.dart';
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
  Test _test = new Test.empty();

  List<Container> progressBoxes = [];
  int _currentQuestion = 0;

  String colorGroupValue = '';

  @override
  void initState(){
    initProgress();
    super.initState();
  }


  void _update(Question question) {

    setState(() {
      _currentQuestion++;
      _test.questions[_currentQuestion-1] = question;
    });
    initProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
            color: Theme.of(context).primaryColor,
            child: SingleChildScrollView(
                padding: EdgeInsets.all(15.0),
                child:  new Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20, right: 5, left: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)
                        ),
                          child: Column(
                              children:[
                                Center(

                                  child:
                                  Row(
                                    children: progressBoxes,
                                    mainAxisAlignment: MainAxisAlignment.center,),
                                ),
                                SizedBox(width: 10, height: 10,),
                                Row(children: [Text("3/10", style:Theme.of(context).textTheme.bodyText1,), Text("02:26", style:Theme.of(context).textTheme.bodyText1,)], mainAxisAlignment: MainAxisAlignment.spaceBetween,),
                                SizedBox(width: 10, height: 10,),

                              ])
                      ),
                      Container(margin: EdgeInsets.only(bottom: 15.0),
                        child:  Text (_test.questions[_currentQuestion].text,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Image.network("http://"+ Strings.baseUrl +"/questions/" + (_test.questions[_currentQuestion].image!=null?_test.questions[_currentQuestion].image : " " )),
                      CustomRadio(_test.questions[_currentQuestion], _update),
                    ])
            )
        )

    );
  }

  void initProgress() {
    int i = 0;
    progressBoxes = [];
    while (i<_test.questions.length){
      var box = new Container(
          height: 10,
          width: 10,
          margin: EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: (_test.questions[i].rightAnswered==null)? Color.fromRGBO(140, 140, 140, 1) :_test.questions[i].rightAnswered? Color.fromRGBO(177, 223, 165, 1) : Color.fromRGBO(255, 156, 150, 1.0),),
            color: (_test.questions[i].rightAnswered==null)? Color.fromRGBO(252, 243, 227, 1) :_test.questions[i].rightAnswered? Color.fromRGBO(177, 223, 165, 1.0) : Color.fromRGBO( 255, 156, 150, 1.0),),
          child: new Center(
          )
      );
      progressBoxes.add(box);
      i++;
    }
  }

}

class CustomRadio extends StatefulWidget {

  Question _question;
  final ValueChanged<Question> update;
  CustomRadio(this._question, this.update){}

  @override
  createState() {
    return new CustomRadioState();
  }
}
class CustomRadioState extends State<CustomRadio> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 400,
      child: new ListView.builder(
        itemCount: widget._question.answers.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            onTap: () {
              setState(() {
                widget._question.rightAnswered =  widget._question.answers[index].right? true : false;
                widget._question.answers.forEach((element) => element.isSelected = false);
                widget._question.answers[index].isSelected = true;
              }
              );
              widget.update(widget._question);
            },
            child: new RadioItem(widget._question.answers[index]),
          );
        },
      ),
    );
  }
}
class RadioItem extends StatelessWidget {
  String colorGroupValue = "first";
  final Answer _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      child:
      Container(
          width: 360,
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            boxShadow:[
              new BoxShadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color:Color.fromRGBO(140, 140, 140, 1),
              ),
            ],
            color: (!_item.isSelected)? Colors.white : _item.right? Color.fromRGBO(224, 246, 195, 1) : Color.fromRGBO(250, 222, 196, 1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
              children: [
                new Container(
                    width: 22,
                    height: 22,
                    margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                    decoration: BoxDecoration(
                      border:  Border.all(width: 2, color: (!_item.isSelected)? Color.fromRGBO(140, 140, 140, 1) : _item.right? Color.fromRGBO(100, 127, 40, 1) : Color.fromRGBO(178, 66, 42, 1),),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                        child: new Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: (!_item.isSelected)? Colors.white : _item.right? Color.fromRGBO(100, 127, 40, 1) : Color.fromRGBO(178, 66, 42, 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ))
                ),
                new Container(
                  margin: new EdgeInsets.only(left: 10.0),
                  child: new Text(_item.text, style: new TextStyle(
                    color: (!_item.isSelected)? Colors.black : _item.right? Color.fromRGBO(100, 127, 40, 1) : Color.fromRGBO(178, 66, 42, 1),)),
                )
              ])

      ),
    );
  }
}