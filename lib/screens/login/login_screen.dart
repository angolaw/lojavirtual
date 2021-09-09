import 'package:flutter/material.dart';
import 'package:lojavirtual/helpers/validators.dart';

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
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: ListView(
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email) {
                      if (!emailValid(email!)) {
                        return "Email inválido";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Senha",
                    ),
                    autocorrect: false,
                    obscureText: true,
                    validator: (password) {
                      if (password!.isEmpty || password.length < 6) {
                        return "Senha inválida!";
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Esqueci minha senha"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 44,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: const Text(
                        "Entrar",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
