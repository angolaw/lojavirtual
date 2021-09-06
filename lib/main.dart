import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  //test firebase
  Firestore.instance.collection('teste').add({'teste': 'admin'});
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Container(
          decoration: const BoxDecoration(color: Colors.greenAccent),
        ));
  }
}
