import 'package:agenda_slim/app/dominio/entidades/contato.dart';
import 'package:agenda_slim/view/contato_details_back.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatoDetails extends StatelessWidget {
  showModalError(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Alerta!'),
      content: Text('Não foi possível encontrar um APP compatível.'),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContatoDetailsBack(context);
    Contato contato = _back.contato;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //Definindo tamanho do avatar 1/3 do tamanho da Tela, ficando Proporcional
        var width = constraints.biggest.width;
        var radius = width / 2.2;
        //var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            //Definindo margen
            padding: EdgeInsets.all(50),
            //Passando as Informações do contato
            children: [
              //Validando se o Contato Informou o Avata e se informou corretamente
              //Classe "Uri" com Método: "tryParse" - Tenta converter um Endereço Url num Imagem
              (Uri.tryParse(contato.urlAvatar).isAbsolute)
                  ? //Caso der certo cria o avatar...
                  CircleAvatar(
                      backgroundImage: NetworkImage(contato.urlAvatar),
                      radius: radius,
                    )
                  : //Se não for possivel ler o end
                  //Cria o avatar padrão do Flutter
                  CircleAvatar(
                      child: Icon(Icons.person, size: width / 2),
                      radius: radius,
                    ),

              //Informações do Contato
              Center(
                child: Text(
                  '${contato.nome}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Telefone:',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  subtitle: Text(
                    '${contato.telefone}',
                    style: TextStyle(fontSize: 15),
                  ),
                  //Definindo os Botôes de chamada e sms do Telefone
                  trailing: Container(
                    width: width / 4,
                    child: Row(children: [
                      //Botão de Chamada
                      IconButton(
                          color: Colors.green,
                          icon: Icon(
                            Icons.phone_android,
                            size: 40,
                          ),
                          onPressed: () {
                            //Função do Botão
                            //Chama o Método de Chamada Externa
                            _back.launchTelefone(showModalError);
                          }),
                      //Botão de Menssagem SMS
                      IconButton(
                          color: Colors.green,
                          icon: Icon(
                            Icons.message,
                            size: 30,
                          ),
                          onPressed: () {
                            //Função do Botão
                            //Chama o Método de Chamada Externa
                            _back.launchSMS(showModalError);
                          }),
                    ]),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'E-Mail:',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  onTap: () {
                    _back.launchEmail(showModalError);
                  },
                  subtitle: Text(
                    '${contato.email}',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            //Definindo o Botão de Voltar da tela de Detales do Contato
            child: Icon(Icons.arrow_back_ios_new),

            //Chama a Função de voltar especificada em "contato_detail_back.dart"
            onPressed: () {
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}
