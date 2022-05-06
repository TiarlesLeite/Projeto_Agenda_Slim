//import 'dart:ffi';
import 'package:agenda_slim/app/dominio/entidades/contato.dart';
import 'package:agenda_slim/app/dominio/services/contato_service_validacao.dart';
import 'package:agenda_slim/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contato_lista_back.g.dart';

class ContatoListaBack = _ContatoListaBack with _$ContatoListaBack;

abstract class _ContatoListaBack with Store {
  var _service = GetIt.I.get<ContatoServiceValidacao>(); //Objeto do serviço

//Lista de Contatos
  @observable
  Future<List<Contato>> lista;

//Método para atualizar a Lista de contatos
  @action
  refreshList([dynamic value]) {
    lista = _service.find();
  }

  _ContatoListaBack() {
    refreshList();
  }

//Método para chamar o Form Salvar/ Alterar
  goToForm(BuildContext context, [Contato contato]) {
    Navigator.of(context).pushNamed(MyApp.CONTATO_FORM, arguments: Contato).then(refreshList);
  }

//Excluir
  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}
