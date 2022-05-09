import 'package:agenda_slim/app/injection.dart';
import 'package:flutter/material.dart';
import 'app/my_app.dart';

void main() {
  //Chama a função "setupInjection()", Assim as configurações da injeção de 
  // dependencias vai valer para todo o Projeto.
  setupInjection();
  //runApp Cria o Objeto responsavel pela execução da Classe (Objeto) MyApp adequandamente.
  runApp(MyApp());
}
