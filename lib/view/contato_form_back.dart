//import 'dart:math';
import 'package:agenda_slim/app/dominio/entidades/contato.dart';
import 'package:agenda_slim/app/dominio/services/contato_service_validacao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../app/my_app.dart';

class ContatoFormBack {
  Contato contato;

//Cria uma variavel que recebe o serviço de dominio para salvar
  var _service = GetIt.I.get<ContatoServiceValidacao>();

//Atributos de Controle para vaidar os campos no formulario
  bool _nomeValida;
  bool _emailValida;
  bool _telefoneValida;

  //goToForm(BuildContext context, [Contact contact]){
  //Navigator.of(context).pushNamed(MyApp.CONTACT_FORM, arguments: contact).then(refreshList);
  //}

  //Validação Geral
  bool get isValid => _nomeValida && _emailValida && _telefoneValida;

  // diferenciar novo com alteração
  ContatoFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    contato = (parameter == null) ? Contato() : parameter;
  }

//Salvar
  save() async {
    await _service.save(contato);
  }

//Validações enquanto preenche o formulario
  String validaNome(String nome) {
    try {
      _service.validaNome(nome);
      _nomeValida = true;
      return null;
    } catch (erro) {
      _nomeValida = false;
      return erro.toString();
    }
  }

  String validaEmail(String email) {
    try {
      _service.validaEmail(email);
      _emailValida = true;
      return null;
    } catch (erro) {
      _emailValida = false;
      return erro.toString();
    }
  }

  String validaTelefone(String telefone) {
    try {
      _service.validaTelefone(telefone);
      _telefoneValida = true;
      return null;
    } catch (erro) {
      _telefoneValida = false;
      return erro.toString();
    }
  }
}
