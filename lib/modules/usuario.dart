
import 'package:flutter_alfabank/modules/module.dart';

class Usuario extends Module {
  String uid;

  Usuario({this.uid});

  @override
  String toString() {
    return 'Usuario{uid: $uid}';
  }
}