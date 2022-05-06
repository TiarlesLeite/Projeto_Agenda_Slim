import 'package:agenda_slim/app/dominio/entidades/contato.dart';
import 'package:flutter/cupertino.dart';

abstract class ContatoDAO {
  save(Contato contato);

  remove(int id);

  Future<List<Contato>> find();
}
