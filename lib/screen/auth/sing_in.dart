
import 'package:flutter/material.dart';
import 'package:flutter_alfabank/components/progress_circular.dart';
import 'package:flutter_alfabank/main.dart';
import 'package:flutter_alfabank/screen/auth/register.dart';
import 'package:flutter_alfabank/services/auth_service.dart';

class SingIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SingInState();

}

class _SingInState extends State<SingIn> {

  String email = "";
  String senha = "";
  final _auth = AuthService();
  String error = "";
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    return
      loading
      ? ProgressCircular()
      : Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: [
          FlatButton.icon(
            onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return Register();
              }),
              );
            },
            icon: Icon(Icons.person),
            label: Text("Registrar"),
            textColor: Colors.white,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 40.0
        ),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? "Insira o E-mail" : null,
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
              TextFormField(
                decoration: const InputDecoration(labelText: "Senha"),
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    senha = val;
                  });
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              RaisedButton(
                child: Text("Login"),
                onPressed: () async {
                  loading = true;

                  if(_formkey.currentState.validate()) {
                    dynamic result = _auth.singInRegisteredUser(email, senha);

                    if(result == null && loading) {
                      setState(() => error = "Login e senha inválidos");
                    }

                    loading = false;
                  } else {
                    loading = false;
                    setState(() => error = "Login e senha inválidos");
                  }
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              Center(
                child: Text(
                  error,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.red
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}