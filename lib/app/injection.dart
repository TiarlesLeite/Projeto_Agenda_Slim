import 'package:agenda_slim/app/database/sqlite/dao/contato_dao_impl.dart';
import 'package:agenda_slim/app/dominio/intefaces/contato_dao.dart';
import 'package:agenda_slim/app/dominio/services/contato_service_validacao.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getit = GetIt.I;
  //Aqui na injeção de dependencias.Foi definido,
  getit.registerSingleton<ContatoDAO>(ConatatoDAOImpl()); 
//quando precisar da operações do banco a "interface_dao.dart" a injeção de depencia cria um objeto com implemet. do DAO.
  getit.registerSingleton<ContatoServiceValidacao>(ContatoServiceValidacao());
}
