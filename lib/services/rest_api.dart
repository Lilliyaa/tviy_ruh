import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter_apptest/model/paragraph.dart';
import 'package:flutter_apptest/model/test.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class APIManager{

  static Future<List<Paragraph>> getLessonsData() async{
    List<Paragraph> lessons = [];
    var uri = Uri.http(Strings.baseUrl, 'api/load_all_lessons.php');
    var response = await http.get(uri);
    if(response.statusCode == 200) {
      var jsonData = jsonDecode(response.body.toString());
      for (var u in jsonData) {
        Paragraph paragraph = Paragraph.fromJson(u);
        lessons.add(paragraph);
      }
    }
    return lessons;
  }

  static Future<String> getLessonText(int id) async{
    String lessonText = "";
    var uri = Uri.http(Strings.baseUrl, 'api/load_lesson_text.php');
    var response = await http.post(uri, body: {
      "id": json.encode(id)
    });
    if(response.statusCode == 200) {
      var jsonData = jsonDecode(response.body.toString());
      lessonText = jsonData;
    }
    return lessonText;
  }

  static Future<List<Test>> getTest(int id) async{
    List<Test> test = [];
    var uri = Uri.http(Strings.baseUrl, 'api/load_lesson_test.php');

   var response = await http.post(uri, body: {
      "id": json.encode(id)
    });
    if(response.statusCode == 200) {
      var jsonData = jsonDecode(response.body.toString());
      for (var u in jsonData) {
        Test temp = Test.fromJson(u);
        test.add(temp);
      }
    }
    return test;
  }
}
