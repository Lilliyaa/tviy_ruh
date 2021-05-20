import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/assets/nav_icons.dart';
import 'package:flutter_apptest/model/provider.dart';
import 'package:flutter_apptest/services/rest_api.dart';
import 'constants.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final Future<List<Provider>> providers = APIManager.getProviderData();
  List<Widget> itemsData = [];


  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Color.fromRGBO(140, 140, 140, 1.0),
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(fontSize: 28,
                        color: Colors.white,
                        decoration: TextDecoration.underline,),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Категорії: " + post["categories"],
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      " ${post["price"]}",
                      style: const TextStyle(fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      " ${post["address"]}",
                      style: const TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                // Image.asset(
                //   "assets/images/${post["image"]}",
                //   height: double.infinity,
                // )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;

    return SafeArea(
        child: Scaffold(
        backgroundColor: Color.fromRGBO(252, 243, 227, 1.0),

    body: Container(
    height: size.height,
    child: Column(
    children: <Widget>[

    const SizedBox(
    height: 10,
    ),

    Expanded(
    child: FutureBuilder<List<Provider>>(
    future: providers,
    builder: (context, snapshot){
    if(snapshot.hasData){
       return ListView.builder(

       itemCount: itemsData.length,
       physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
    return itemsData[index];
    }),
    ],}
    else {
    return Center(
    child: CircularProgressIndicator()
    );
    }
    }
    )
    ,
    )
    ,
    )
    ,
    );
  }
}




