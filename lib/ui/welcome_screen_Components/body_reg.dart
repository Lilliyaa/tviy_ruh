import 'package:flutter/material.dart';
import 'package:flutter_apptest/ui/welcome_screen_Components/rounded_input_field.dart';
import 'package:flutter_apptest/ui/welcome_screen_Components/round_btn.dart';
import 'package:flutter/src/widgets/icon.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({
    Key key,
    @required this.child
  }) :super (key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(),
          appBar: MyCustomAppBar(
            height: 100,
          ),
          body: Container(
            //margin: EdgeInsets.symmetric(vertical: 100),
            //height: size.height,
            width: double.infinity,
            child: ListView (
              //mainAxisAlignment: MainAxisAlignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: <Widget>[
                RoundedInputField(
                  hintText: "Прізвище",
                  onChanged: (value){} ,
                ),
                RoundedInputField(
                  hintText: "Ім'я",
                  icon: Icons.accessibility,
                  onChanged: (value){} ,
                ), RoundedInputField(
                  hintText: "Електронна адреса",
                  icon: Icons.alternate_email_rounded,
                  onChanged: (value){} ,
                ),  RoundedInputField(
                  hintText: "Телефон",
                  icon: Icons.add_ic_call,
                  onChanged: (value){} ,
                ),
                RoundPassword(onChange: (value){},),
                // SizedBox(height: size.height*0.1),
                RoundedButton(
                  text: "Зареєструватися",
                  press: (){},
                ),
                // SizedBox(height: size.height*0.01),
                OrDivider(),
              ],
            ),
          )
      ),
    );
  }
}

class OrDivider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width*0.8,
        child: Row(
          children: <Widget>[
            Expanded(child:
            Divider(color: Color.fromRGBO(139, 103, 46, 1),
              height: 1.5,)
            ),
            Text("АБО",

              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(139, 103, 46, 1),
                fontWeight: FontWeight.w600,
              ),),
            Expanded(child:
            Divider(color: Color.fromRGBO(139, 103, 46, 1),
              height: 1.5,)
            ),
          ],
        )
    );
  }
}

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color.fromRGBO(254, 187, 87, 1),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text("Швидка реєстрація",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 20 ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}