import 'package:agenda_slim/app/dominio/entidades/contato.dart';
import 'package:flutter/cupertino.dart';

class ContatoDetailsBack {
  BuildContext context;
  Contato contato;

  ContatoDetailsBack(this.context) {
    contato = ModalRoute.of(context).settings.arguments;
  }
  goToBack() {
    Navigator.of(context).pop();
  }
}
