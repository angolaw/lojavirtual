import 'package:flutter/material.dart';
import 'package:lojavirtual/helpers/validators.dart';

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
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                TextFormField(
                    validator: (nome) {
                      if (nome!.isEmpty) {
                        return "Campo obrigatório";
                      } else if (nome.length < 2)
                        return "Nome muito curto";
                      else if (nome.trim().split(' ').length <= 1) {
                        return "Insira o nome completo";
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(hintText: "Nome completo")),
                const SizedBox(height: 16),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email!.isEmpty) {
                        return 'Campo Obrigatório';
                      } else if (!emailValid(email)) return "Email inválido";
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Email",
                    )),
                const SizedBox(height: 16),
                TextFormField(
                    obscureText: true,
                    validator: (pass) {
                      if (pass!.isEmpty)
                        return "Campo Obrigatório";
                      else if (pass.length < 6) return "Senha muito curta";
                      return null;
                    },
                    decoration: const InputDecoration(hintText: "Senha")),
                const SizedBox(height: 16),
                TextFormField(
                    obscureText: true,
                    validator: (pass) {
                      if (pass!.isEmpty)
                        return "Campo Obrigatório";
                      else if (pass.length < 6) return "Senha muito curta";
                      return null;
                    },
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
