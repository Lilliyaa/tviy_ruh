import 'package:flutter/material.dart';
import 'package:flutter_apptest/model/exam.dart';
import 'package:flutter_apptest/services/rest_api.dart';

class Exams extends StatelessWidget {
  final nums = [ 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
    21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,
    41,42,43,44,45,46,47,48,49,50, 51];

  final Future<List<Exam>> _exams = APIManager.selectExams();

  // List<ExamIcon> getIconsList(){
  //   List<ExamIcon> icons;
  //   for(var exam in exams){
  //
  //   }
  // }

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
                  List<Exam> nexams = snapshot.data ?? [];
                  return Wrap(
                    spacing: 10,
                    runSpacing: 20,
                    children: nexams.map((e) => ExamIco(e)).toList(),
                  );
                }else{
                  return Center(
                      child: CircularProgressIndicator()
                  );
                }
              },
              // child: Wrap(
              //   direction: Axis.horizontal,
              //   spacing: 10,
              //   runSpacing: 20,
              //   children: nums.map((e) => ExamIcon()).toList(),
              // ),
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
        //shape: BoxShape.circle,
        // border: Border.all(
        //   width: 5,
        //   color: Colors.purpleAccent,
        //   style: BorderStyle.solid,
        // ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
        // gradient: LinearGradient(
        //   colors: [
        //     Colors.greenAccent,
        //     Colors.yellow,
        //     Colors.cyanAccent,
        //   ],
        // ),
      ),
    );
  }
}


class ExamIcon extends StatefulWidget {
  const ExamIcon({Key key}) : super(key: key);

  @override
  _ExamIconState createState() => _ExamIconState();
}

class _ExamIconState extends State<ExamIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("1"),
      alignment: Alignment.center,
      height: 45,
      width: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        //shape: BoxShape.circle,
        // border: Border.all(
        //   width: 5,
        //   color: Colors.purpleAccent,
        //   style: BorderStyle.solid,
        // ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
        // gradient: LinearGradient(
        //   colors: [
        //     Colors.greenAccent,
        //     Colors.yellow,
        //     Colors.cyanAccent,
        //   ],
        // ),
      ),
    );
  }
}
