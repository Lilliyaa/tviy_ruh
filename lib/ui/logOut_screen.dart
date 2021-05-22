import 'package:flutter/material.dart';
import 'package:flutter_apptest/services/authentification.dart';

class LogOut extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("logout"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: signOut,
          child: Text("LogOut"),
        ),
      ),
    );
  }

  Future<void> signOut() async{
    await Authentification().signOut();
  }
  
}