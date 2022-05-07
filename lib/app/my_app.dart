import 'package:agenda_slim/view/contato_details.dart';
import 'package:agenda_slim/view/contato_form.dart';
import 'package:flutter/material.dart';
import '../view/lista_contato.dart';

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  //Definimos as rotas no MyApp. Para quando utilizar na Lista basta chamar o MyApp
  static const HOME = '/';
  static const CONTATO_FORM = 'contato-form';
  static const CONTATO_DETAILS = 'contato_details';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        //app de Strings Nome e Rota um Wigit responsavel.
        HOME: (context) => ListaContato(), // '/' seria a rota da tela principal
        CONTATO_FORM: (context) => ContatoForm(),
        CONTATO_DETAILS:(context) => ContatoDetails()
      },
    );
  }
}
