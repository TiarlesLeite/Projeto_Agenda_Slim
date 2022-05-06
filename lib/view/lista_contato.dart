import 'package:agenda_slim/app/dominio/entidades/contato.dart';
import 'package:agenda_slim/view/contato_lista_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListaContato extends StatelessWidget {
  final _back = ContatoListaBack();

//Classe para tratar o Avatar
  CircleAvatar circleAvatar(String url) {
    if (Uri.tryParse(url).isAbsolute) {
      //Verifica se o link da imagem é valido
      return CircleAvatar(backgroundImage: NetworkImage(url));
    } else {
      return CircleAvatar(child: Icon(Icons.person));
    }
  }

  //Método para o Botão Editar
  Widget iconEditButton(Function onPressed) {
   // Contato contato;
    return IconButton(
        icon: Icon(Icons.edit),
        color: Colors.orange,
         onPressed: onPressed);
      
  }

  //Método para botão Excluir
  Widget iconRemoveButton(BuildContext context, Function() remove) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirma a Exclusão?'),
                    actions: [
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: remove,
                      ),
                    ],
                  ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Conteiner possui posições predefinidas como appBar, body etc...
        appBar: AppBar(
          title: Text('Lista de Contatos'),
          actions: [
            //define uma lista de botões.
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _back.goToForm(context);
                  //Cria o botão de voltar para lista de Contatos (<-)
                  //Passa Rota erdada do MyApp
                  // Navigator.of(context).pushNamed( MyApp.CONTATO_FORM);
                })
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              //Widget para trabalhar com os dados futuros
              future: _back.lista,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator(); // Widget de Loading...
                } else {
                  List<Contato> lista = futuro.data;
                  //Metodo buider constrole a lista
                  return ListView.builder(                    
                    // traz a quantidades de elementos da lista
                    itemCount: lista.length, 
                    itemBuilder: (context, i) {
                      var contato = lista[i];
                      return ListTile(
                        leading: circleAvatar(contato.urlAvatar),
                        title: Text(contato.nome),
                        
                        subtitle: Text(contato.telefone),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton(() { _back.goToForm(context, contato);
                              }),
                              iconRemoveButton(context, () {
                                _back.remove(contato.id);
                                Navigator.of(context).pop();
                              })
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}
