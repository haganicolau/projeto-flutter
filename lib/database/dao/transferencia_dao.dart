
import 'package:flutter_alfabank/database/app_database.dart';
import 'package:flutter_alfabank/modules/transferencia.dart';
import 'package:sqflite/sqflite.dart';

class TransferenciaDAO {

  static final String tableSQL = 'CREATE TABLE transferencias ('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account_number TEXT, '
      'value REAL)';

  Future<int> save(Transferencia transferencia) async {
    final Database db = await createDatabase(tableSQL);

    final Map<String, dynamic> transferenciaMap = toMap(transferencia);
    return db.insert("transferencias", transferenciaMap);
  }

  Map<String, dynamic> toMap(Transferencia transferencia) {
    final Map<String, dynamic> transferenciaMap = Map();

    transferenciaMap["name"] = transferencia.nome;
    transferenciaMap["account_number"] = transferencia.conta;
    transferenciaMap["value"] = transferencia.valor;

    return transferenciaMap;
  }

  Future<List<Transferencia>> findAll() async {

    final Database db = await createDatabase(tableSQL);
    final List<Map<String, dynamic>> maps = await db.query("transferencias");

    return toListObject(maps);
  }

  List<Transferencia> toListObject(result) {
    final List<Transferencia> transferencias = List();

    for(Map<String, dynamic> map in result) {
      var transferencia = Transferencia(
          nome: map['name'],
          conta: map['account_number'],
          valor: map['value'],
          id: map['id']
      );

      transferencias.add(transferencia);
    }

    return transferencias;
  }


}