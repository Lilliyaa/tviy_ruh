import 'package:flutter/material.dart';
import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:flutter_apptest/model/Users/UserStudent.dart';
import 'package:flutter_apptest/services/authentification.dart';
import 'package:flutter_apptest/services/authentification.dart';
import 'package:flutter_apptest/services/rest_api.dart';
import 'package:flutter_apptest/ui/design/simpleTextIconButton.dart';
import 'package:flutter_apptest/ui/statistic_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Nav.dart';
import 'achieves_screen.dart';
import 'payment_screen.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  Future<UserStudent> _user;

  @override
  void initState() {
    _user = APIManager.loadUserStudent(Authentification().getCurrentEmail());
    super.initState();
  }

  void update(){
    setState(() {
      _user = APIManager.loadUserStudent(Authentification().getCurrentEmail());
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: FutureBuilder<UserStudent>(
            future: _user,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 250,
                          width: 200,
                          child: CircleAvatar(
                            child: ClipOval(
                              child: Image.network(
                                  "http://" +
                                      Strings.baseUrl +
                                      "/avatars/" +
                                      snapshot.data.avatar,
                                  height: 200,
                                  width: 250,
                                  fit: BoxFit.fill),
                            ),
                            radius: 50,
                          ),
                        ),
                        SimpleTextIconButton(
                            text: 'Мій профіль',
                            icon: Icon(
                              Icons.account_circle_sharp,
                              color: Color.fromRGBO(254, 187, 87, 1),
                            ),
                            press: () {
                              // TO DO: open profile, just pass snapshot.data  :)

                            }),
                        SimpleTextIconButton(
                            text: 'Статистика',
                            icon: Icon(
                              Icons.bar_chart_sharp,
                              color: Color.fromRGBO(254, 187, 87, 1),
                            ),
                            press: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Statistic();
                              }));
                            }),
                        SimpleTextIconButton(
                            text: 'Ачівки',
                            icon: Icon(
                              Icons.wine_bar_sharp,
                              color: Color.fromRGBO(254, 187, 87, 1),
                            ),
                            press: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Achieves();
                              }));
                            }),
                        Visibility(
                          visible: !snapshot.data.is_premium,
                          child: SimpleTextIconButton(
                              text: 'Придбати преміум',
                              icon: Icon(
                                Icons.attach_money_sharp,
                                color: Color.fromRGBO(254, 187, 87, 1),
                              ),
                              press: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Payment(update: update);
                                }));
                              }),
                        ),
                        SimpleTextIconButton(
                            text: 'Допомога',
                            icon: Icon(Icons.warning_amber_outlined),
                            press: () {
                              openWeb("https://github.com/Lilliyaa/tviy_ruh");
                            }),
                        SimpleTextIconButton(
                            text: 'Веб-версія',
                            icon: Icon(Icons.add_link),
                            press: () {
                              openWeb("http://yihal27k.beget.tech/");
                            }),
                        SimpleTextIconButton(
                            text: 'Вихід',
                            icon: Icon(Icons.exit_to_app),
                            press: () {
                              signOut();
                            }),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      );
}

Future<void> signOut() async {
  await Authentification().signOut();
}

void openWeb(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}