import 'package:agenda_slim/app/database/sqlite/dao/contato_dao_impl.dart';
import 'package:agenda_slim/app/dominio/intefaces/contato_dao.dart';
import 'package:agenda_slim/app/dominio/services/contato_service_validacao.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getit = GetIt.I;

///Foi definido na injeção de dependencia (getit) que quando precisar das operações do banco de dados
///no caso "contato_dao.dart", é para a injeção de dependencias criar e injetar um Objeto na
///implementação do dao "contato_dao_impl.dart".

//registerSingleton = cria um unico Objeto para atender todas chamadas
  getit.registerSingleton<ContatoDAO>(ConatatoDAOImpl()); 

  getit.registerSingleton<ContatoServiceValidacao>(ContatoServiceValidacao());
}
