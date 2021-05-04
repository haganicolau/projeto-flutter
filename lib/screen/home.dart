import 'package:flutter/material.dart';
import 'package:flutter_alfabank/components/item_menu.dart';
import 'package:flutter_alfabank/screen/lista_transferencia.dart';
import 'package:flutter_alfabank/services/auth_service.dart';

class Home extends StatelessWidget {

  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            textColor: Colors.white,
            icon: Icon(Icons.person_add_disabled_outlined),
            label: Text("Logout"),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
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
