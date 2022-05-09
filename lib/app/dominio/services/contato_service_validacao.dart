import 'package:agenda_slim/app/dominio/entidades/contato.dart';
import 'package:agenda_slim/app/dominio/exception/dominio_layer_exception.dart';
import 'package:agenda_slim/app/dominio/intefaces/contato_dao.dart';
import 'package:get_it/get_it.dart';

class ContatoServiceValidacao {
  //var dao = ContatoDAOImpl(); --> desse modo ficamos dependete da tecnologia SQLite

  //Com injeção de dependencias fica independete da tecnologia de um (dao) especifico, desque que tenha
  // acesso as operações do banco pode ser qualquer banco implementado.
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
      throw new DominioLayerException('O nome é obrigatório.');
    } else if (nome.length < min) {
      throw new DominioLayerException(
          'O nome de possuir pelo menos $min caracteres.');
    } else if (nome.length > max) {
      throw new DominioLayerException(
          'O nome de possuir o máximo $max caracteres.');
    }
  }

  //email -> Seja Obrigatório e tenha @
  validaEmail(String email) {
    if (email == null) {
      throw new DominioLayerException('O e-mail é obrigatório.');
    } else if (!email.contains('@')) {
      throw new DominioLayerException('O e-mail deve possuir @.');
    }
  }

  //telefone -> Seja obrigatório e tenha o formato (99) 9 9999-9999
  validaTelefone(String telefone) {
    //Formatao: (99) 9 9999-9999
    var format = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$');
    if (telefone == null) {
      throw new DominioLayerException('O telefofone é obrigatório.');
    } else if (!format.hasMatch(telefone)) {
      throw new DominioLayerException(
          'Formato Inválido! O Formato deve ser (99) 9 9999-9999.');
    }
  }
}
