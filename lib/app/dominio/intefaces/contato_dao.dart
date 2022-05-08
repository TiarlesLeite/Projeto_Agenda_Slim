import 'package:agenda_slim/app/dominio/entidades/contato.dart';
import 'package:flutter/cupertino.dart';

abstract class ContatoDAO {

  ///Nesse dao apenas definimos oque ira fazer como:  Salvar/Alterar, Excluir e Buscar os contatos
  save(Contato contato);

  remove(int id);

  Future<List<Contato>> find();

  ///Definimos só a estrutura sem a implementação.
  ///A implementação está na camada de infraestrutura (database\sqlite > dao > contato_dao_impl.dart)
}
