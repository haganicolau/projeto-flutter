
import 'package:flutter/material.dart';
import 'package:flutter_alfabank/modules/usuario.dart';
import 'package:flutter_alfabank/screen/auth/authenticate.dart';
import 'package:flutter_alfabank/screen/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Usuario>(context);


    if(user != null) {
      return Home();
    } else {
      return Authenticate();
    }


  }

}