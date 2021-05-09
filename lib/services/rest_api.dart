import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter_apptest/model/paragraph.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class APIManager{

  static Future<List<Paragraph>> getLessonsData() async{
    List<Paragraph> lessons = [];

    var uri = Uri.http(Strings.base_url, 'api/load_all_lessons.php');
    var response = await http.get(uri);
    if(response.statusCode == 200) {
      var jsonData = jsonDecode(response.body.toString());
      for (var u in jsonData) {
        Paragraph paragraph = Paragraph.fromJson(u);
        lessons.add(paragraph);
      }
      print(lessons.length);
    }
    return lessons;
  }

}
