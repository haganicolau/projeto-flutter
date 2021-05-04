import 'package:flutter_alfabank/modules/module.dart';

class Transferencia extends Module {
  double valor;
  String conta;
  String nome;
  int id;

  Transferencia({this.valor, this.conta, this.nome, this.id});

  @override
  String toString() {
    return 'Transferencia{id: $id, valor: $valor, conta: $conta, nome: $nome}';
  }
}