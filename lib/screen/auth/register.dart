
import 'package:flutter/material.dart';
import 'package:flutter_alfabank/services/auth_service.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();

}

class _RegisterState extends State<Register> {

  final _formkey = GlobalKey<FormState>();
  String email = "";
  String pass;
  String error;
  final authService = AuthService();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 48.0
        ),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? "Insira um email" : null,
                decoration: const InputDecoration(labelText: "E-mail"),
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField (
                validator: (val) => val.length < 8 ? "Senha deve ter no mínimo 8 caracteres" : null,
                decoration: const InputDecoration(labelText: "Senha"),
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    pass = val;
                  });
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              RaisedButton(
                child: Text("Cadastrar"),
                onPressed: () {
                  if(_formkey.currentState.validate()) {

                    dynamic result = authService.registerWithEmailAndPassword(email, pass);
                    print(result);
                    /*Navigator pop*/
                  } else {
                    setState(() {
                      error = "Insira um e-mail válido!";
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

}