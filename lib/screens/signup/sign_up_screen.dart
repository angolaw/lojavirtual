import 'package:flutter/material.dart';
import 'package:lojavirtual/helpers/validators.dart';
import 'package:lojavirtual/models/user.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var user = User("", "");

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
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Consumer<UserManager>(builder: (_, userManager, __) {
                return ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      enabled: !userManager.loading,
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
                          const InputDecoration(hintText: "Nome completo"),
                      onSaved: (name) => user.name = name,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      enabled: !userManager.loading,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'Campo Obrigatório';
                        } else if (!emailValid(email)) return "Email inválido";
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Email",
                      ),
                      onSaved: (email) => user.email = email!,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      enabled: !userManager.loading,
                      obscureText: true,
                      validator: (pass) {
                        if (pass!.isEmpty)
                          return "Campo Obrigatório";
                        else if (pass.length < 6) return "Senha muito curta";
                        return null;
                      },
                      decoration: const InputDecoration(hintText: "Senha"),
                      onSaved: (pass) => user.password = pass!,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      enabled: !userManager.loading,
                      obscureText: true,
                      validator: (pass) {
                        if (pass!.isEmpty)
                          return "Campo Obrigatório";
                        else if (pass.length < 6) return "Senha muito curta";
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: "Repita a senha"),
                      onSaved: (confirmation) =>
                          user.confirmPassword = confirmation!,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 44,
                      child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          disabledColor:
                              Theme.of(context).primaryColor.withAlpha(100),
                          textColor: Colors.white,
                          onPressed: userManager.loading
                              ? null
                              : () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();

                                    if (user.password != user.confirmPassword) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text("Senhas não coincidem"),
                                        backgroundColor: Colors.red,
                                      ));
                                      return;
                                    }
                                    //userManager
                                    userManager.signUp(
                                        user: user,
                                        onSuccess: () {
                                          Navigator.of(context).pop();
                                        },
                                        onFail: (e) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content:
                                                Text("Falha ao cadastrar: $e"),
                                            backgroundColor: Colors.red,
                                          ));
                                        });
                                  }
                                },
                          child: userManager.loading
                              ? const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : const Text(
                                  "Criar Conta",
                                  style: TextStyle(fontSize: 18),
                                )),
                    )
                  ],
                );
              }),
            )),
      ),
    );
  }
}
