import 'package:agenda_slim/app/dominio/entidades/contato.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatoDetailsBack {
  BuildContext context;
  Contato contato;

  ContatoDetailsBack(this.context) {
    contato = ModalRoute.of(context).settings.arguments;
  }
  goToBack() {
    Navigator.of(context).pop();
  }

//Método para Fazer a chamada externa: Abrir Chamada, Abrir e-mail etc
  _launchApp(String url, Function(BuildContext context) showModalError) async {
    await canLaunch(url) ? await launch(url) : showModalError(context);
  }

  launchTelefone(Function(BuildContext context) showModalError) {
    _launchApp('tel:${contato.telefone}', showModalError);
  }

  launchSMS(Function(BuildContext context) showModalError) {
    _launchApp('sms:${contato.telefone}', showModalError);
  }

  launchEmail(Function(BuildContext context) showModalError) {
    _launchApp('mailto:${contato.email}', showModalError);
  }
}
