import 'package:agenda_slim/app/database/sqlite/conexao_db.dart';
import 'package:agenda_slim/app/dominio/entidades/contato.dart';
import 'package:agenda_slim/app/dominio/intefaces/contato_dao.dart';
import 'package:sqflite/sqflite.dart';

///Quem define o que o "dao" deve fazer, Salvar, Alterar, Excluir ou Consultar é a camada de
///domínio do Projeto aonde definirmos o que precisa e como trabalhar.
///Mas quem implementa de fato é a camada de Infraestrutura no qual chamamos aqui de Database.
///Parece uma coisa só, né? Mas não.
///Quando separamos o domínio da infraestrutura estamos separando as regras de negócio com uma
///implementação especifica criando uma independente de tecnologia. Por exemplo, hoje estamos
///utilizando aqui o SQLITE. Se daqui um tempo resolve substituir a tecnologia o db em especifico,
///basta implementar um novo db, aproveitando toda as regras do domínio e da camada de visão(view),
///favorecendo o trabalho em equipe, reaproveitamento do código, a aplicação de testes específicos e
///facilita a manutenção além deque o conhecimento dessa infraestrutura, dessa visão de implementação
///valoriza o profissional.


//implementando a classe "contato_dao.dart" da camada de dominio (dominio > interfaces > contato_dao.dart)

class ConatatoDAOImpl implements ContatoDAO { 
  //Objeto do sqflite como os metodos de Salvar/Alterar, Exluir e Consultar 
  Database _db; 

  @override
  Future<List<Contato>> find() async {
    _db = await ConexaoDB.get(); //Definindo o Objeto
    List<Map<String, dynamic>> resultado =
        await _db.query('contato'); //Buscando Registro
    List<Contato> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Contato(
          id: linha['id'],
          nome: linha['nome'],
          telefone: linha['telefone'],
          email: linha['email'],
          urlAvatar: linha['url_avatar']);
    });
    return lista;
  }

  @override
  remove(int id) async {
    _db = await ConexaoDB.get();
    var sql = 'DELETE FROM contato WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Contato contato) async {
    _db = await ConexaoDB.get();
    var sql;
    if (contato.id == null) {
      sql =
          'INSERT INTO contato(nome, telefone, email, url_avatar) VALUES (?,?,?,?)';
      _db.rawInsert(sql,
          [contato.nome, contato.telefone, contato.email, contato.urlAvatar]);
    } else {
      sql =
          'UPDATE contato SET nome = ?, telefone = ?, email = ?, url_avatar = ? WHERE id = ?';
      _db.rawUpdate(sql, [
        contato.nome,
        contato.telefone,
        contato.email,
        contato.urlAvatar,
        contato.id
      ]);
    }
  }
}
