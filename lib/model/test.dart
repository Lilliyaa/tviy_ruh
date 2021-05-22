
import 'dart:convert';
import 'question.dart';

Test sightModelFromJson(String str) => Test.fromJson(json.decode(str));

String sightModelToJson(Test data) => json.encode(data.toJson());


class Test {
  int id;
  List<Question> questions;

  Test(
    this.id,
    [this.questions]
  );
  // Test.empty(){
  //
  //   var rules1 = ["Дії або бездіяльність учасників дорожнього руху та інших осіб не повинні створювати небезпеку чи перешкоду для руху, загрожувати життю або здоров'ю громадян, завдавати матеріальних збитків.", "Дії або бездіяльність учасників дорожнього руху та інших осіб не повинні створювати небезпеку чи перешкоду для руху, загрожувати життю або здоров'ю громадян, завдавати матеріальних збитків."];
  //   var rules2 = ["Дії або бездіяльність учасників дорожнього руху та інших осіб не повинні створювати небезпеку чи перешкоду для руху, загрожувати життю або здоров'ю громадян, завдавати матеріальних збитків."];
  //   var rules3 = ["Пішоходи повинні переходити проїзну частину по пішохідних переходах, у тому числі підземних і надземних, а у разі їх відсутності - на перехрестях по лініях тротуарів або узбіч.","Дії або бездіяльність учасників дорожнього руху та інших осіб не повинні створювати небезпеку чи перешкоду для руху, загрожувати життю або здоров'ю громадян, завдавати матеріальних збитків.", "Дії або бездіяльність учасників дорожнього руху та інших осіб не повинні створювати небезпеку чи перешкоду для руху, загрожувати життю або здоров'ю громадян, завдавати матеріальних збитків."];
  //
  //   this.id = 1;
  //
  //   var answer1 = new Answer();
  //   answer1.text = "first";
  //   answer1.id = 2;
  //   answer1.right = true;
  //   var answer2 = new Answer();
  //   answer2.text = "second";
  //   answer2.right = false;
  //   answer2.id = 3;
  //   var answer3 = new Answer();
  //   answer3.text = "third";
  //   answer3.right = false;
  //   answer3.id = 4;
  //   var answer4 = new Answer();
  //   answer4.text = "4";
  //   answer4.right = true;
  //   answer4.id = 8;
  //   var answer5 = new Answer();
  //   answer5.text = "five";
  //   answer5.right = false;
  //   answer5.id = 5;
  //   var answer6 = new Answer();
  //   answer6.text = "six";
  //   answer6.right = false;
  //   answer6.id = 6;
  //   var answer7 = new Answer();
  //   answer7.text = "seven";
  //   answer7.right = true;
  //   answer7.id = 7;
  //
  //   var question1 = new Question();
  //   question1.image = "picture1.jpg";
  //   question1.relatedRooles = rules1;
  //   question1.id = 1;
  //   question1.text = "Кому дозволено рух у даній ситуації?Кому"
  //       " дозволено рух у даній ситуації?Кому дозволено рух у даній ситуації?";
  //   question1.rightAnswerIndex = 0;
  //   question1.answers = [answer1, answer2];
  //   var question2 = new Question();
  //   question2.relatedRooles = rules2;
  //   question2.id = 1;
  //   question2.text = "First2";
  //   question2.rightAnswerIndex = 0;
  //   question2.answers = [answer3, answer4];
  //   var question3 = new Question();
  //   question3.relatedRooles = rules3;
  //   question3.id = 1;
  //   question3.text = "First3";
  //   question3.rightAnswerIndex = 0;
  //   question3.answers = [answer5, answer6, answer7];
  //
  //   this.questions = [question1, question2, question3];
  // }

  factory Test.fromJson(Map<String, dynamic> json) {
        var questionObjsJson = json['questions'] as List;
        List<Question> _questions = questionObjsJson.map((questionJson) => Question.fromJson(questionJson)).toList();
        return Test(
         int.parse(json['id'].toString()),
        _questions,
        );
  }

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "questions": questions,
      };

}
