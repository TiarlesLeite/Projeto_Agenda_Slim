//Classe de Conexão
import 'dart:async';
import 'package:agenda_slim/app/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class ConexaoDB {

  //static pertencendo a classe e não ao Objeto todos possui acesso ao mesmo ponto. Assim 
  //consigo criar uma unica conexão para todo App.
  static Database _db;

  static Future<Database> get() async {

    //verificando se já exite a conexão
    if (_db == null) {
      // Conexão com Banco
      var caminho_db = join(await getDatabasesPath(), 'banco_contatos');
      deleteDatabase(caminho_db);
      _db = await openDatabase(
        caminho_db,
        version: 1,
        onCreate: (db, v) {
          //criando tabela
          db.execute(createTable); 
          //Para Iniciar o App já com contatos
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
