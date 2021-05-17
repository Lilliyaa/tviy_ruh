
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
  List<String> relatedRooles;

  Question({
    this.id,
    this.text,
    this.rightAnswerIndex,
    this.image,
    this.answers,
    this.relatedRooles,
    this.rightAnswered,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
      id: int.parse(json["id"]),
      rightAnswerIndex: json["rightAnswerIndex"],
      text: json["text"],
      image: json["image"],
      answers: json["answers"],
      relatedRooles: json["relatedRooles"],
  );

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
