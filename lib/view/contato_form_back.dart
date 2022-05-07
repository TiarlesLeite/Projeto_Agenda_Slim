//import 'dart:math';
import 'package:agenda_slim/app/dominio/entidades/contato.dart';
import 'package:agenda_slim/app/dominio/services/contato_service_validacao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class ContatoFormBack {
  Contato contato;

//Cria uma variavel que recebe o serviço de dominio para salvar
  var _service = GetIt.I.get<ContatoServiceValidacao>();

//Atributos de Controle para validar os campos no formulario.
  bool _nomeValida;
  bool _emailValida;
  bool _telefoneValida;

  //Validação Geral
  @action
  bool get isValid => _nomeValida && _emailValida && _telefoneValida;

  // diferenciar novo da alteração
  ContatoFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    contato = (parameter == null) ? Contato() : parameter;
  }

//Salvar
  save(BuildContext context) async {
    await _service.save(contato);
    Navigator.of(context).pop();
  }

//Validações enquanto preenche o formulário
  String validaNome(String nome) {
    try {
      _service.validaNome(nome);
      _nomeValida = true;
      return null;
    } catch (e) {
      _nomeValida = false;
      return e.toString();
    }
  }

  String validaEmail(String email) {
    try {
      _service.validaEmail(email);
      _emailValida = true;
      return null;
    } catch (e) {
      _emailValida = false;
      return e.toString();
    }
  }

  String validaTelefone(String telefone) {
    try {
      _service.validaTelefone(telefone);
      _telefoneValida = true;
      return null;
    } catch (e) {
      _telefoneValida = false;
      return e.toString();
    }
  }
}
