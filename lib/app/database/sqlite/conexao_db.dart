//Classe de Conexão
import 'dart:async';
import 'package:agenda_slim/app/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ConexaoDB {
  static Database _db;

  static Future<Database> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'banco_contatos');
      deleteDatabase(path);
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTable); //criando tabela
          db.execute(insert1);
          db.execute(insert2);
          db.execute(insert3);
          db.execute(insert4);
          db.execute(insert5);
        },
      );
    }
    return _db;
  }
}
