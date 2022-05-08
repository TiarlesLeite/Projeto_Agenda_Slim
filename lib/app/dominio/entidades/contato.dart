//Classe de Entidades: Foi Padronizado a forma de representar o contato no Projeto
//Agora ao invés do banco de dados mandar um Map diretamente para Widget, será convertido para o Objeto
///Contato que mandará para Widget, pode representar mais trabalho. Mas independente do Widget dependera
///exclusivamente dos dados da classe de entidades, no qual não será mais alterado. Tornando independente,
///se o banco de dados for alterado não mandando mais Widget e passa a mandar JSON basta converter para
///o Objeto da classe e manda para Widget se precisar alterar nada. Eu acho...kkkkk
///

class Contato {
  int id;
  String nome;
  String telefone;
  String email;
  String urlAvatar; //Atributos
  Contato({this.id, this.nome, this.telefone, this.email, this.urlAvatar});
}
