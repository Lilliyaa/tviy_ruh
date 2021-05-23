import 'package:flutter/material.dart';
import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter_apptest/model/sign_data.dart';
import 'package:flutter_apptest/services/rest_api.dart';

class SignDetails extends StatelessWidget {
  int id;
  String name;
  Future<SignData> signData;

  SignDetails(this.id, this.name) {
    signData = APIManager.getSignData(id);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        appBar: AppBar(
          title: Text(name),),
        body: FutureBuilder <SignData>(
            future: signData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String img = "http://" +
                    Strings.baseUrl +
                    "/signs/" + snapshot.data.image;
                        return Center(
                        child:Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
              boxShadow: [ BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
              ),
              ],
              ),
              height: size.height * 0.85,
              width: size.width * 0.9,
              child: SingleChildScrollView(
              child: Column(
              children: [
              Image.network(img),
              Container(
              padding: EdgeInsets.all(15),
              child: Text(snapshot.data.text),
              )
              ],
              ),
              ),
              )
              );
              }
              else {
              return Center(
              child: CircularProgressIndicator()
              );
              }
            }
        ));
  }
}
