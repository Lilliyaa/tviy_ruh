import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter_apptest/model/achieve.dart';
import 'package:flutter_apptest/model/paragraph.dart';
import 'package:flutter_apptest/model/test.dart';
import 'package:flutter_apptest/model/exam.dart';
import 'package:flutter_apptest/model/provider.dart';
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

  static Future<List<Test>> getExamTest(int id) async{
    List<Test> test = [];
    var uri = Uri.http(Strings.baseUrl, 'api/load_exam_test.php');
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
  
  static Future<List<Test>> getLessonTest(int id) async{
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

static Future<List<Exam>> selectExams(int student_id) async{
    List<Exam> exams = [];
    var uri = Uri.http(Strings.baseUrl, 'api/select_exams.php');
    var response = await http.post(uri, body: {
      "student_id": json.encode(student_id)
    });
    if(response.statusCode == 200) {
      var jsonData = jsonDecode(response.body.toString());
      for (var u in jsonData) {
        Exam exam = Exam.fromJson(u);
        exams.add(exam);
      }
    }
    return exams;
  }


  static Future<List<Provider>> getProviderData() async{
    List<Provider> providers = [];
    var uri = Uri.http(Strings.baseUrl, 'api/load_provider.php');
    var response = await http.get(uri);
    if(response.statusCode == 200) {
      var jsonData = jsonDecode(response.body.toString());
      for (var u in jsonData) {
        var provider = Provider.fromJson(u);
        providers.add(provider);
      }
    }
    return providers;
  }

  static Future<List<Achieve>> selectAchieves(int student_id) async{
    List<Achieve> achieves = [];
    var uri = Uri.http(Strings.baseUrl, 'api/select_achieves.php');
    var response = await http.post(uri, body: {
      "student_id": json.encode(student_id)
    });
    if(response.statusCode == 200) {
      var jsonData = jsonDecode(response.body.toString());
      for (var u in jsonData) {
        Achieve achieve = Achieve.fromJson(u);
        achieves.add(achieve);
        print(achieve.toString());
      }
    }
    return achieves;
  }
  

}
