
import 'package:flutter/material.dart';
import 'package:flutter_apptest/theme.dart';
import 'package:flutter_apptest/ui/widget_tree.dart';
import 'ui/Nav.dart';
import 'ui/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        StreamProvider.value(value: FirebaseAuth.instance.authStateChanges()),
      ],
      child: WidgetTree(),
    );
  }
}