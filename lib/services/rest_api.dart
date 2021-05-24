import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter_apptest/model/Users/UserStudent.dart';
import 'package:flutter_apptest/model/achieve.dart';
import 'package:flutter_apptest/model/paragraph.dart';
import 'package:flutter_apptest/model/sign_data.dart';
import 'package:flutter_apptest/model/test.dart';
import 'package:flutter_apptest/model/exam.dart';
import 'package:flutter_apptest/model/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class APIManager{

  static Future<List<Paragraph>> getLessonsData(String email) async{
    List<Paragraph> lessons = [];
    var uri = Uri.http(Strings.baseUrl, 'api/load_all_lessons.php');
    var response = await http.post(uri,
        body: {
          "email": json.encode(email),
        });
    if(response.statusCode == 200) {
      var jsonData = jsonDecode(response.body.toString());
      for (var u in jsonData) {
        Paragraph paragraph = Paragraph.fromJson(u);
        lessons.add(paragraph);
      }
    }
    return lessons;
  }

  static Future<void> addUserStudent(String name, String surname, String email) async{
    var uri = Uri.http(Strings.baseUrl, 'api/add_user_student.php');
    await http.post(uri, body: {
      "name": json.encode(name),
      "surname": json.encode(surname),
      "email": json.encode(email),
    });

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

  static Future<SignData> getSignData(int id) async{
    List<SignData> signData = [];
    var uri = Uri.http(Strings.baseUrl, 'api/load_sign_data.php');
    var response = await http.post(uri, body: {
      "id": json.encode(id)
    });
    print(response.statusCode);
    if(response.statusCode == 200) {
      var strData = response.body.toString();
      var jsonData = jsonDecode(strData);
      for (var u in jsonData) {
        SignData temp = SignData.fromJson(u);
        signData.add(temp);
      }
    }
    return signData[0];
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


  static Future<void> switchUserToPremium(String email) async{
    var uri = Uri.http(Strings.baseUrl, 'api/switch_to_premium.php');
    var response = await http.post(uri, body: {
      "email": json.encode(email)
    });
    if(response.statusCode == 200) {
      var jsonData = jsonDecode(response.body.toString());
    }
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


  static Future<List<Provider>> getProviderData(String text) async{
    List<Provider> providers = [];
    var uri = Uri.http(Strings.baseUrl, 'api/load_provider.php');
    var response = await http.post(uri, body: {
      "text": json.encode(text)
    });
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
        //print(achieve.toString());
      }
    }
    return achieves;
  }

  static Future<UserStudent> loadUserStudent(String email) async {
    List<UserStudent> users = [];
    var uri = Uri.http(Strings.baseUrl, 'api/load_user_student.php');
    var response = await http.post(uri, body: {
      "email": json.encode(email)
    });
    if(response.statusCode == 200) {
      var jsonData = jsonDecode(response.body.toString());
      for (var u in jsonData) {
        UserStudent userStudent = UserStudent.fromJson(u);
        users.add(userStudent);
        return users[0];
      }
    }
  }

  static Future<void> updateLessonData(String currentEmail, int paragraphId, int new_res) async {
    var uri = Uri.http(Strings.baseUrl, 'api/update_lesson_progress.php');
    var response = await http.post(uri, body: {
      "email": json.encode(currentEmail),
      "id": json.encode(paragraphId),
      "new_res": json.encode(new_res),
    });
    if(response.statusCode == 200) {
      var jsonData = response.body.toString();
      var data;
    }
  }

}
