import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(App());
 
class App extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Personas con discapacidad en Costa Rica ',
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: HomePage(),
    );
  }
}




