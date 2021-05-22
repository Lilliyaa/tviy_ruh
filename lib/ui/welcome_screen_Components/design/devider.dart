import 'package:flutter/material.dart';


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
