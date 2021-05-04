
import 'package:flutter/material.dart';
import 'package:flutter_alfabank/services/auth_service.dart';

class SingInAnon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SingInAnonState();

}

class _SingInAnonState extends State<SingInAnon> {

  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Anônimo"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/sing.png'),
            ),
            RaisedButton(
              child: Text("Sing In"),
              onPressed: () async {
                print("Logando...");
                final user = await _auth.singInAnon();
                print(user.toString());

              },
            )
          ],
        ),
      ),
    );
  }

}