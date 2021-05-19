
import 'dart:convert';

import 'answer.dart';
import 'question.dart';

Test sightModelFromJson(String str) => Test.fromJson(json.decode(str));

String sightModelToJson(Test data) => json.encode(data.toJson());


class Test {
  int id;
  List<Question> questions;

  Test({
    this.id,
    this.questions
  });
  Test.empty(){
    this.id = 1;

    var answer1 = new Answer();
    answer1.text = "first";
    answer1.id = 2;
    answer1.right = true;
    var answer2 = new Answer();
    answer2.text = "second";
    answer2.right = false;
    answer2.id = 3;
    var answer3 = new Answer();
    answer3.text = "third";
    answer3.right = false;
    answer3.id = 4;

    var question1 = new Question();
    question1.image = "picture1.jpg";
    question1.id = 1;
    question1.text = "Кому дозволено рух у даній ситуації?Кому"
        " дозволено рух у даній ситуації?Кому дозволено рух у даній ситуації?";
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

    this.questions = [question1, question2, question3,question1, question2, question3,question1, question2, question3,question1, question2, question3,question1, question2, question3,question1, question2, question3,question1, question2];
  }

  factory Test.fromJson(Map<String, dynamic> json) => Test(
      id: int.parse(json["id"]),
    questions: json["questions"],
  );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "questions": questions,
      };

}
