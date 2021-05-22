import 'package:flutter/material.dart';
import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter_apptest/ui/welcome_screen_Components/rounded_input_field.dart';
import 'package:flutter_apptest/ui/welcome_screen_Components/round_btn.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:flutter_apptest/ui/statistic_screen.dart';



import 'Nav.dart';



class More extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>

      Scaffold(
        backgroundColor: Theme.of(context).primaryColor,

        body:
           Container(

        child: Container(

          child: Column(children: [

            SizedBox(
              height:250,
              width: 200,
              child: CircleAvatar(
                child: ClipOval(


                  child: Image.network("http://" +

                      Strings.baseUrl +
                      "/avatars/" +"Forsage.jpg",height: 200 ,width: 250,
                      fit: BoxFit.fill ),
                ),
                radius: 50,
              ),
                ),
            SizedBox(

                height:50, //height of button
                width:double.infinity, //width of button
                child:ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(252, 243, 227, 1),

                    onPrimary: Colors.grey,
                    shadowColor: Colors.grey,
                    padding: EdgeInsets.only(right: 0),
                  ),
                  label: Text('   Мій профіль',
                    style: const TextStyle(fontSize: 20,   fontWeight: FontWeight.bold,),

                  ),
                  icon: Icon(Icons.account_circle_sharp, color: Color.fromRGBO(254, 187, 87, 1),),
                  onPressed: () {


                  },

                )
            ),

            SizedBox(
                height:50,
                width:double.infinity,
                child:ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(252, 243, 227, 1),

                    onPrimary: Colors.grey,
                    shadowColor: Colors.grey,
                    padding: EdgeInsets.only(right: 0),
                  ),
                  label: Text('   Статистика',
                    style: const TextStyle(fontSize: 20,   fontWeight: FontWeight.bold,),
                  ),
                  icon: Icon(Icons.bar_chart_sharp,color: Color.fromRGBO(254, 187, 87, 1)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context){
                              return Statistic();
                            }
                        )
                    );
                  },
                )
            ),

            SizedBox(
                height:50,
                width:double.infinity, //width of button
                child:ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(252, 243, 227, 1),

                    onPrimary: Colors.grey,
                    shadowColor: Colors.grey,
                    padding: EdgeInsets.only(right: 0),
                  ),
                  label: Text('            Ачівки',
                    style: const TextStyle(fontSize: 20,   fontWeight: FontWeight.bold,),
                  ),
                  icon: Icon(Icons.wine_bar_sharp, color: Color.fromRGBO(254, 187, 87, 1)),
                  onPressed: () {


                  },
                )
            ),

            SizedBox(
                height:50,
                width:double.infinity,
                child:ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(252, 243, 227, 1),

                    onPrimary: Colors.grey,
                    shadowColor: Colors.grey,
                    padding: EdgeInsets.only(right: 50),
                  ),
                  label: Text('Придбати преміум',
                    style: const TextStyle(fontSize: 20,   fontWeight: FontWeight.bold,),
                  ),
                  icon: Icon(Icons.attach_money_sharp, color: Color.fromRGBO(254, 187, 87, 1), ),
                  onPressed: () {


                  },
                )
            ),
            SizedBox(
                height:50,
                width:double.infinity,
                child:ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(252, 243, 227, 1),

                    onPrimary: Colors.grey,
                    shadowColor: Colors.grey,
                    padding: EdgeInsets.only(right: 0),
                  ),
                  label: Text('      Допомога',
                    style: const TextStyle(fontSize: 20,   fontWeight: FontWeight.bold,),
                  ),
                  icon: Icon(Icons.warning_amber_outlined,),
                  onPressed: () {


                  },

                )
            ),
            SizedBox(
                height:50,
                width:double.infinity,
                child:ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(252, 243, 227, 1),

                    onPrimary: Colors.grey,
                    shadowColor: Colors.grey,
                    padding: EdgeInsets.only(right: 0),
                  ),
                  label: Text('    Веб-версія',
                    style: const TextStyle(fontSize: 20,   fontWeight: FontWeight.bold,),
                  ),
                  icon: Icon(Icons.add_link),
                  onPressed: () {

                  },

                )
            ),
          ],
          ),


        ),
           ));


}