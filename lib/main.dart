
import 'package:flutter/material.dart';
import 'package:flutter_apptest/theme.dart';
import 'ui/Nav.dart';
import 'ui/welcome_screen.dart';
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
      debugShowCheckedModeBanner: false, //добавлено. Не знаю, что это значит
      //theme: myLightTheme,
      theme: ThemeData(
          primaryColor: Color.fromRGBO(252, 243, 227, 1),
          scaffoldBackgroundColor: Color.fromRGBO(252, 243, 227, 1)),
      title: "Добро пожаловать в \"Твій рух\"",
      //title: "Bottom Nav Bar",
      //home: Nav(),
      home: WelcomeScreen(),
    );
  }
}