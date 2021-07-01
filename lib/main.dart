import 'package:flutter/material.dart';
import 'package:social/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          hintColor: Color(0xFFC0F0E8),
          primaryColor: Colors.teal[500],
          fontFamily: "Montserrat",
          canvasColor: Colors.transparent),
      home: Home(),
    );
  }
}
