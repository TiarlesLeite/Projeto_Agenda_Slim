//Regra de Negocio
//import 'dart:js_util';

import 'package:agenda_slim/app/dominio/entidades/contato.dart';
import 'package:agenda_slim/app/dominio/exception/dominio_da_exception.dart';
import 'package:agenda_slim/app/dominio/intefaces/contato_dao.dart';
import 'package:get_it/get_it.dart';

class ContatoServiceValidacao {
 
  var _dao = GetIt.I.get<ContatoDAO>();
  //Tem que salvar um contato, ter a possibilidade de alterar excluir e listar todos os contatos
  save(Contato contato) {
    validaNome(contato.nome);
    validaEmail(contato.email);
    validaTelefone(contato.telefone);
    _dao.save(contato);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Contato>> find() {
    return _dao.find();
  }

  //nome -> Seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
  validaNome(String nome) {
    var min = 5;
    var max = 50;

    if (nome == null) {
      throw new DominioDaException('O nome é obrigatório.');
    } else if (nome.length < min) {
      throw new DominioDaException(
          'O nome de possuir pelo menos $min caracteres.');
    } else if (nome.length > max) {
      throw new DominioDaException(
          'O nome de possuir o máximo $max caracteres.');
    }
  }

  //email -> Seja Obrigatório e tenha @
  validaEmail(String email) {
    if (email == null) {
      throw new DominioDaException('O e-mail é obrigatório.');
    } else if (!email.contains('@')) {
      throw new DominioDaException('O e-mail deve possuir @.');
    }
  }

  //telefone -> Seja obrigatório e tenha o formato (99) 9 9999-9999
  validaTelefone(String telefone) {
    var formato = RegExp(
        r'^\([1-9]{2}\)[9][6-9]{1}[0-9]{3}\-[0-9]{4}$'); //Formatao: (99) 9 9999-9999
    if (telefone == null) {
      throw new DominioDaException('O telefofone é obrigatório.');
    } else if (formato.hasMatch(telefone)) {
      throw new DominioDaException(
          'Formato Inválido! O Formato deve ser (99) 9 9999-9999.');
    }
  }
}
