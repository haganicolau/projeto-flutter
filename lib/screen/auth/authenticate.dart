
import 'package:flutter/material.dart';
import 'package:flutter_alfabank/screen/auth/sing_in.dart';

class Authenticate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthtenticateState();

}

class _AuthtenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingIn(),
    );
  }

}