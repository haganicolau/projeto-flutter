import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alfabank/database/app_database.dart';
import 'package:flutter_alfabank/modules/transferencia.dart';
import 'package:flutter_alfabank/modules/usuario.dart';
import 'package:flutter_alfabank/screen/auth/wrapper.dart';
import 'package:flutter_alfabank/screen/formulario_transferencia.dart';
import 'package:flutter_alfabank/screen/home.dart';
import 'package:flutter_alfabank/screen/lista_transferencia.dart';
import 'package:flutter_alfabank/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple[500],
        accentColor: Colors.deepPurple[400],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurple[700],
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: Scaffold(
        body: StreamProvider<Usuario>.value(
          value: AuthService().user,
          child: Wrapper(),
        ),
      )
    );
  }

}






