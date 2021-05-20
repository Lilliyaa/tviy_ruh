
import 'dart:convert';

import 'answer.dart';

Question sightModelFromJson(String str) => Question.fromJson(json.decode(str));

String sightModelToJson(Question data) => json.encode(data.toJson());


class Question {
  int id;
  String text;
  int rightAnswerIndex;
  String image;
  List<Answer> answers;
  bool rightAnswered;
  String relatedRooles;

  Question(
    this.id,
    this.text,
    this.rightAnswerIndex,
    this.image,
    this.answers,
    this.relatedRooles,
  );


  factory Question.fromJson(Map<String, dynamic> json) {
    var answersObjsJson = json['answers'] as List;
    List<Answer> _answers = answersObjsJson.map((answerJson) => Answer.fromJson(answerJson)).toList();
    return Question(
      int.parse(json["id"]),
      json["text"],
      -1,
      json["image"],
      _answers,
      json["relatedRooles"],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "text": text,
        "rightAnswerIndex": rightAnswerIndex,
        "image": image,
        "answers": answers,
        "relatedRooles": relatedRooles
      };

}
