import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/theme.dart';
import '../theme.dart';
import 'package:flutter_apptest/assets/statistic_icons.dart';
import 'dart:async';
import 'package:flutter_share/flutter_share.dart';

class StatisticData{
  String allLessons;
  String allExams;
  String allAchivment;

  String realLessons;
  String realExams;
  String realAchivment;

  String persentLessons;
  String persentExams;
  String persentAchivment;

  String getPercent(String a, String b){
    String res;
    var resInt = int.parse(b)/int.parse(a)*100;
    res = resInt.toString();
    return res;
  }
}

StatisticData _data = new StatisticData();


class Statistic extends StatefulWidget {
  Statistic()
  {
    _data.allLessons = "60";
    _data.allExams = "40";
    _data.allAchivment = "20";

    _data.realLessons = "10";
    _data.realExams = "1";
    _data.realAchivment = "5";

    _data.persentLessons = "20";
    _data.persentExams = "1";
    _data.persentAchivment= "10";
    print(_data.allLessons);
  }

  @override
  _StatisticState createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {


  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: myLightTheme.primaryColor,
    body: ListView(
      padding: EdgeInsets.all(16),
      children: [
        buildRoundedCard(context, StatisticIcons.lessons, "Заняття", "Усього пройдено уроків:", _data.allLessons,  _data.realLessons, _data.persentLessons),
        buildRoundedCard(context,StatisticIcons.exams, "Екзамени", "Пройдено білетів:", _data.allExams,_data.realExams, _data.persentExams),
        buildRoundedCard(context,StatisticIcons.achievment, "Ачівки", "Зароблено ачівок:" , _data.allAchivment, _data.realAchivment,_data.persentAchivment),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(StatisticIcons.share),
              onPressed: () {
                String results = "Агов, тільки подивись на мої результати!\n - тем вивчено: ${_data.allLessons},\n - тестів пройдено: ${_data.realExams},\n - винагород отримано: ${_data.realAchivment}!\n\n Ти також можеш вивчати ПДД разом із \"Твій рух\"";
                shareFile(results, "Мої результати!");
              },
            ),
          ],
        )
      ],
    ),
  );
}

Future<void> shareFile(dynamic link, String title) async {
  await FlutterShare.share(
    title: "Мої результати",
    text: title,
    linkUrl: link,
    chooserTitle: "Поділіться резульататами!"
  );
}

Widget buildRoundedCard(
    BuildContext context,
    IconData icon,
    String ttl,
    String txt,
    String all,
    String real,
    String percent)
{
  return Card(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
  ),
    child: Container(
      height: 200,
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16 ),
        child: Column
          (//crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text(ttl,
                    style:
                  Theme.of(context).textTheme.headline2),
                ],
              ),
              SizedBox(width: 50,)
            ],
          ),
          Divider(
            color: Color.fromRGBO(143, 141, 141, 1),
            height: 20,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(txt,
                style: Theme.of(context).textTheme.headline3),
              Text(real+"/"+all,
                style: Theme.of(context).textTheme.headline3),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Середній результат: "+percent+"%",
                style: Theme.of(context).textTheme.headline3),
            ],
          ),
        ],
      ),
      ),
    ),
  );
}
