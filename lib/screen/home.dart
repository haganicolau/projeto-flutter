import 'package:flutter/material.dart';
import 'package:flutter_alfabank/components/item_menu.dart';
import 'package:flutter_alfabank/screen/lista_transferencia.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 50.0, 8.0, 24.0),
            child: Text(
              "Olá, Hagamenon",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              ItemMenu(
                action: ListaTransferencia(),
                icone: Icons.cached,
                nomeMenu: "Transferências",
              ),
              ItemMenu(
                action: ListaTransferencia(),
                icone: Icons.credit_card,
                nomeMenu: "Cartão de Crédito",
              )
            ],
          ),
        ],
      ),
    );
  }
}
