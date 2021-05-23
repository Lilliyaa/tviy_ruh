import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter_apptest/model/provider.dart';
import 'package:flutter_apptest/services/rest_api.dart';

import 'package:flutter_apptest/ui/map_screen.dart';
import 'constants.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Provider>> providers;
  List<Provider> providersList;
  List<Container> itemsData = [];

  @override
  void initState() {
    providers = APIManager.getProviderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 243, 227, 1.0),
      body: FutureBuilder<List<Provider>>(
          future: providers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              providersList = snapshot.data;
              formCards();
              return ListView.builder(
                  itemCount: itemsData.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return itemsData[index];
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(backgroundColor: Color.fromRGBO(254, 187, 87, 1),
        child: Icon(Icons.location_on_outlined, ),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context) => myMap())),

      ),
    );
  }

  void formCards() {
    itemsData = [];
    providersList.forEach((provider) {
      itemsData.add(
        Container(
          padding: EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Color.fromRGBO(140, 140, 140, 1.0),
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  provider.type,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Roboto",
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network("http://" +
                        Strings.baseUrl +
                        "/avatars/" +
                        (provider.avatar != null ? provider.avatar : " ")),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        provider.name,
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Категорії: ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 17,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Ціна: ",
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                provider.category,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: "Roboto",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                provider.price,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: "Roboto",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),


                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        width: 210,
                        child:  Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                          provider.address,
                            textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        ),
                      )

                    ],
                  )
                ],
              ),
            ],
          ),
          // Image.asset(
          //   "assets/images/${post["image"]}",
          //   height: double.infinity1,
          // )
        ),
      );
    });
  }
}
