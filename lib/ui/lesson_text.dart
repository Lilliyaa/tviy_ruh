import 'package:flutter/material.dart';
import 'package:flutter_apptest/services/rest_api.dart';
class LessonText extends StatelessWidget{

  final int id;
  Future<String> lessonText;

  LessonText(this.id){
    lessonText = APIManager.getLessonText(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder<String>(
          future: lessonText,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return   Container(
                  decoration: new BoxDecoration(
                      color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
                      borderRadius: new BorderRadius.all( Radius.circular(15.0))
                  ),
              margin: EdgeInsets.only(left: 10.0, top: 10, right: 10, bottom: 80),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(15.0),
                      child: Text(snapshot.data, style: Theme.of(context).textTheme.bodyText1,)
                  )
              );

            } else{
              return Center(
                  child: CircularProgressIndicator()
              );
            }
          }
      ),
    );
  }
}




