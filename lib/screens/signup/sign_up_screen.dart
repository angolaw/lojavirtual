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
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Email",
                    )),
                const SizedBox(height: 16),
                TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "Senha")),
                const SizedBox(height: 16),
                TextFormField(
                    obscureText: true,
                    decoration:
                        const InputDecoration(hintText: "Repita a senha")),
                const SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      disabledColor:
                          Theme.of(context).primaryColor.withAlpha(100),
                      textColor: Colors.white,
                      onPressed: () {},
                      child: const Text(
                        "Criar Conta",
                        style: TextStyle(fontSize: 18),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
