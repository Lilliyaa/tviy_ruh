import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter_apptest/model/answer.dart';
import 'package:flutter_apptest/model/question.dart';
import 'package:flutter_apptest/model/test.dart';
import 'package:flutter_apptest/services/authentification.dart';
import 'package:flutter_apptest/services/rest_api.dart';

class TestScreen extends StatefulWidget {
  int id;
  String type;
  Function update;

  TestScreen(this.id, this.type, this.update) {}

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _time;
  Future<List<Test>> _test;
  Test loadedTest;
  bool _buttonNextVisibility = false;
  List<Container> progressBoxes = [];
  int _currentQuestion = 0;

  String colorGroupValue = '';

  @override
  void initState() {
    if (widget.type == "exam") {
      _test = APIManager.getExamTest(widget.id);
    } else if (widget.type == "lesson") {
      _test = APIManager.getLessonTest(widget.id);
    }
    super.initState();
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestion < loadedTest.questions.length - 1) {
        _currentQuestion++;
        _buttonNextVisibility = false;
      }
    });
  }

  void _updateProgress(Question question) {
    setState(() {
      loadedTest.questions[_currentQuestion] = question;
      _buttonNextVisibility = true;
    });
    initProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(widget.type == "exam" ? 50.0 : 0),
            // here the desired height
            child: AppBar(
              title: Text("Екзамен"),
            )),
        body: FutureBuilder<List<Test>>(
            future: _test,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                loadedTest = snapshot.data[0];
                initProgress();
                _time = loadedTest.questions.length * 60;
                return Container(
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                        padding: EdgeInsets.all(15.0),
                        child: new Column(children: [
                          Container(
                              padding:
                                  EdgeInsets.only(top: 20, right: 5, left: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: Column(children: [
                                Center(
                                  child: Row(
                                    children: progressBoxes,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      (_currentQuestion + 1).toString() +
                                          "/" +
                                          loadedTest.questions.length
                                              .toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      "5:13",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    )
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                                SizedBox(
                                  width: 10,
                                  height: 10,
                                ),
                              ])),
                          Container(
                            margin: EdgeInsets.only(bottom: 15.0),
                            child: Text(
                              loadedTest.questions[_currentQuestion].text,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          SizedBox(
                              width: 340,
                              child: Image.network("http://" +
                                  Strings.baseUrl +
                                  "/questions/" +
                                  (loadedTest.questions[_currentQuestion]
                                              .image !=
                                          null
                                      ? loadedTest
                                          .questions[_currentQuestion].image
                                      : " "))),
                          CustomRadio(loadedTest.questions[_currentQuestion],
                              _updateProgress),
                          Visibility(
                              visible: _buttonNextVisibility &&
                                  (!loadedTest.questions[_currentQuestion]
                                      .rightAnswered),
                              child: Text(loadedTest
                                  .questions[_currentQuestion].relatedRooles)),
                          Visibility(
                            visible: _buttonNextVisibility,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context)
                                        .appBarTheme
                                        .backgroundColor),
                                child: Text(
                                    (_currentQuestion ==
                                            loadedTest.questions.length - 1
                                        ? "Завершити тест"
                                        : "Наступне питання"),
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .appBarTheme
                                          .titleTextStyle
                                          .color,
                                      fontFamily: Theme.of(context)
                                          .appBarTheme
                                          .titleTextStyle
                                          .fontFamily,
                                      fontSize: 17,
                                    )),
                                onPressed: () {
                                  _currentQuestion ==
                                          loadedTest.questions.length - 1
                                      ? _endTest(loadedTest.id)
                                      : _nextQuestion();
                                }),
                          ),
                        ])));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  _endTest(int paragraphId) async {
    int res = 0;
    for (var question in loadedTest.questions) {
      if (question.rightAnswered != null && question.rightAnswered) {
        res++;
      }
    }
    if (widget.type == "exam") {
      //TO DO
    } else if (widget.type == "lesson") {
      APIManager.updateLessonData(Authentification().getCurrentEmail(), paragraphId,res);
    }

    await Future.delayed(Duration(milliseconds: 100));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: Text(
              "Тест завершено!",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            content: Text(
              "Ви набрали " +
                  res.toString() +
                  "\\" +
                  loadedTest.questions.length.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text("Повернутися"),
                onPressed: () {
                  widget.update();
                  Navigator.of(context).pop(true);
                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        });
  }

  void initProgress() {
    int i = 0;
    progressBoxes = [];
    while (i < loadedTest.questions.length) {
      var box = new Container(
          height: 10,
          width: 10,
          margin: EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: (loadedTest.questions[i].rightAnswered == null)
                  ? Color.fromRGBO(140, 140, 140, 1)
                  : loadedTest.questions[i].rightAnswered
                      ? Color.fromRGBO(177, 223, 165, 1)
                      : Color.fromRGBO(255, 156, 150, 1.0),
            ),
            color: (loadedTest.questions[i].rightAnswered == null)
                ? Color.fromRGBO(252, 243, 227, 1)
                : loadedTest.questions[i].rightAnswered
                    ? Color.fromRGBO(177, 223, 165, 1.0)
                    : Color.fromRGBO(255, 156, 150, 1.0),
          ),
          child: new Center());
      progressBoxes.add(box);
      i++;
    }
  }
}

class CustomRadio extends StatefulWidget {
  Question _question;
  final ValueChanged<Question> updateProgress;

  CustomRadio(this._question, this.updateProgress) {}

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
              if (widget._question.rightAnswered == null) {
                setState(() {
                  widget._question.rightAnswered =
                      widget._question.answers[index].right ? true : false;
                  widget._question.answers
                      .forEach((element) => element.isSelected = false);
                  widget._question.answers[index].isSelected = true;
                });
                widget.updateProgress(widget._question);
              }
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
      child: Container(
          width: 360,
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Color.fromRGBO(140, 140, 140, 1),
              ),
            ],
            color: (!_item.isSelected)
                ? Colors.white
                : _item.right
                    ? Color.fromRGBO(224, 246, 195, 1)
                    : Color.fromRGBO(250, 222, 196, 1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(children: [
            new Container(
                width: 22,
                height: 22,
                margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: (!_item.isSelected)
                        ? Color.fromRGBO(140, 140, 140, 1)
                        : _item.right
                            ? Color.fromRGBO(100, 127, 40, 1)
                            : Color.fromRGBO(178, 66, 42, 1),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                    child: new Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: (!_item.isSelected)
                        ? Colors.white
                        : _item.right
                            ? Color.fromRGBO(100, 127, 40, 1)
                            : Color.fromRGBO(178, 66, 42, 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ))),
            new Container(
              width: 320,
              margin: new EdgeInsets.only(left: 10.0),
              child: new Text(_item.text,
                  style: new TextStyle(
                    color: (!_item.isSelected)
                        ? Colors.black
                        : _item.right
                            ? Color.fromRGBO(100, 127, 40, 1)
                            : Color.fromRGBO(178, 66, 42, 1),
                  )),
            )
          ])),
    );
  }
}
