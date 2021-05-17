import 'package:flutter/material.dart';
import 'package:flutter_apptest/model/exam.dart';
import 'package:flutter_apptest/services/rest_api.dart';

class Exams extends StatelessWidget {

  final Future<List<Exam>> _exams = APIManager.selectExams(1);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black12,
      child: ListView(
        //physics: BouncingScrollPhysics(),
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Оберіть екзаменаційний білет",
              style: TextStyle(
                color: Color.fromRGBO(122, 120, 120, 1),
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
            alignment: Alignment.topCenter,
            child: FutureBuilder(
              future: _exams,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return Wrap(
                    spacing: 10,
                    runSpacing: 20,
                    children: snapshot.data.map((e) => ExamIco(e)).toList(),
                  );
                }else{
                  return Center(
                      child: CircularProgressIndicator()
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
class ExamIco extends StatelessWidget {
  //const ExamIco({Key key}) : super(key: key);

  final Exam _exam;
 const ExamIco(this._exam) : super();

  Color getColor(){
    Color color;
    if(_exam.rightAnswers == "null"){
      color = Colors.white;
    }
    else{
      int ra = int.parse(_exam.rightAnswers);
      if(ra < 90){
        color = Color.fromRGBO(253, 255, 130, 1);
      }
      else{
        color = Color.fromRGBO(177, 223, 165, 1);
      }
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_exam.id.toString()),
      alignment: Alignment.center,
      height: 45,
      width: 55,
      decoration: BoxDecoration(
        color: getColor(),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }
}
