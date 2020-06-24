import 'package:flutter/material.dart';
import 'widgets/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        fontFamily: 'CenturyGothic',
          primarySwatch: Colors.amber,
          brightness: Brightness.dark,
          accentColor: Colors.amberAccent),

      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}
