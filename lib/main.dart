import 'package:flutter/material.dart';
import 'homepage.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Visualizacion de la informacion',
      theme: ThemeData(
        primaryColor: Color(0xffff6101),
      ),
      home: HomePage(),
    );
  }
}