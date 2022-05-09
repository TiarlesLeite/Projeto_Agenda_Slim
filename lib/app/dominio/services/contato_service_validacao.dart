import 'package:agenda_slim/app/dominio/entidades/contato.dart';
import 'package:agenda_slim/app/dominio/exception/dominio_layer_exception.dart';
import 'package:agenda_slim/app/dominio/intefaces/contato_dao.dart';
import 'package:get_it/get_it.dart';

///Aqui o serviço de validação da camada de dominio que estabelece as regras do negocio não se
/// limitando as operações do banco de dados, diferente do "dao" não estando associado a uma unica entidade.
/// Não utilizamos um objeto com as operações do banco de dados "ConatatoDAOImpl" no
/// caso o "dao especifico do 'SQLite",(var dao = ConatatoDAOImpl();). Preciso utilizar as operações do banco,
/// mas para não tornar o projeto dependente de uma tecnologia no caso SQLite.
///Uma pequena analogia: Uma empresa (dominio) de programadores é movida a café (Operações do db). Pra isso tem o Sr.João (SQLite),que
/// faz o café perfeito. A empresa que precisa do programadores que depende do café, se o joão não for trabalha a empresa
/// para. Não depender do joão (SQLite) e manter o mesmo café é extremamente importante.Pra resolver foi especificado o café como fazer
/// para um empresa tercerizada (Plugin Get_it) inserir (Injetar) outra pessoa (Dependencia) para fazer quando o João não for.
///No caso aqui no Projeto:
///Para isso definimos as especificações (café) do que precisamos (no caso as operações do banco "contato_dao.dart" )
///E para implementar (joão) as especificações utilizei a classe "contato_dao_Impl.dart".
///Vamos injetar as depencencias necessarias, para isso utilizamos o Plugin Get_it(Empresa Tercerizada)
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

///Agora nosso serviço "ContatoServiceValidacao", tem acesso ao que precisa no
/// caso as operações do banco de dados sem especificar um "dao" sem determinar uma tecnologia, 
/// foi cria uma independencia em resumo, funciona define um dao qualquer e na atribuição
/// delegamos uma injeção de dependencia (Get_It) como as operações do banco de dados definidas
/// no caso no "contato_dao.dart", como: save, remove e find.
/// A injeção de dependencia "injection.dart", a necessidade das operações do banco de dados 
/// "contato_dao.dart"(ContatoDAO), basta cria um objeto "contato_dao_Impl.dart"(ConatatoDAOImpl)
/// e injetar as dependencias. Injetando numa variavel de atribuição recebendo o objeto implementação
/// do "SQLite".
/// Com tudo separado e passado tempo optar por substituir a tecnologia "SQLite", basta só cria um novo 
/// "dao", "contato_dao_Impl.dart"(ConatatoDAOImpl) do novo  banco de dados, determinido no arquivo 
/// de configuração "injection.dart" o novo "dao".
/// Assim na camada de serviço "ContatoServiceValidacao", permanece tudo igual e sem alteração e 
/// independente de tecnologia.
/// 