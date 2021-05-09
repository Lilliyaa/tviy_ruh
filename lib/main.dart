
import 'package:flutter/material.dart';
import 'package:flutter_apptest/theme.dart';
import 'ui/Nav.dart';
/*Future<String> _makeGetRequest() async {

  // make request
  Response response = await get('http://b95251oq.beget.tech/api/load_all_lessons.php');

  // sample info available in response
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String contentType = headers['content-type'];
  String json = response.body;
  print(json);
  return json;

}*/

void main(){
  runApp(MyApp());
  // _makeGetRequest();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: myLightTheme,
      title: "Bottom Nav Bar",
      home: Nav(),
    );
  }
}