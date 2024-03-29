import 'package:flutter/material.dart';
import 'package:flutter_alfabank/modules/transferencia.dart';

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  ItemTransferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text("R\$ ${this.transferencia.valor.toString()}"),
        subtitle: Text("${this.transferencia.nome} - Conta: ${this.transferencia.conta}"),
      ),
    );
  }
}