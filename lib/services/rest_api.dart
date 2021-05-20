import 'package:flutter_apptest/constants/strings.dart';
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
      //  print(exam.toString());
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
        //print(provider.toString());
      }
    }
    return providers;
  }

  
  

}
