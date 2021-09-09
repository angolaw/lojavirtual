import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrar"),
        leading: const BackButton(),
        actions: [const Center(child: Text("Criar conta"))],
        centerTitle: true,
      ),
      body: Center(
        child: Card(
            child: ListView(
          children: [TextFormField()],
        )),
      ),
    );
  }
}
