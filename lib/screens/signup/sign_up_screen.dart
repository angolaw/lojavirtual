import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar Conta"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                TextFormField(
                    decoration:
                        const InputDecoration(hintText: "Nome completo")),
                const SizedBox(height: 16),
                TextFormField(
                    decoration: const InputDecoration(hintText: "Email")),
                const SizedBox(height: 16),
                TextFormField(
                    decoration: const InputDecoration(hintText: "Senha")),
                const SizedBox(height: 16),
                TextFormField(
                    decoration:
                        const InputDecoration(hintText: "Repita a senha")),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                      child: const Text(
                        "Criar conta",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
