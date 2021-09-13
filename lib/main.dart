import 'package:flutter/material.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:lojavirtual/screens/base/base_screen.dart';
import 'package:lojavirtual/screens/login/login_screen.dart';
import 'package:lojavirtual/screens/signup/sign_up_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
  //test firebase
  //can use the abreviated call name "pedidos/0001"
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => UserManager(),
        lazy: false,
        child: MaterialApp(
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
          initialRoute: '/base',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/signup':
                return MaterialPageRoute(builder: (_) => SignUpScreen());
              case '/login':
                return MaterialPageRoute(builder: (_) => LoginScreen());
              case '/base':
              default:
                return MaterialPageRoute(builder: (_) => BaseScreen());
            }
          },
        ));
  }
}
