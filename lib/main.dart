import 'package:flutter/material.dart';
import 'package:lojavirtual/screens/base/base_screen.dart';

void main() async {
  runApp(MyApp());
  //test firebase
  //can use the abreviated call name "pedidos/0001"
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Loja Virtual',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color.fromARGB(
              255,
              4,
              125,
              141,
            ),
            scaffoldBackgroundColor: const Color.fromARGB(
              255,
              4,
              125,
              141,
            ),
            appBarTheme: const AppBarTheme(
              elevation: 0,
            )),
        home: BaseScreen());
  }
}
