//import 'dart:js';

import 'package:agenda_slim/view/contato_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:path/path.dart';

class ContatoForm extends StatelessWidget {
//Métodos dos campos do Formulario Abaixo
  final _form = GlobalKey<FormState>();

  Widget fieldName(ContatoFormBack back) {
    return TextFormField(
        validator: back.validaNome,
        onSaved: (newValue) => back.contato.nome = newValue,
        initialValue: back.contato.nome,
        decoration: InputDecoration(labelText: 'Nome:'));
  }

  Widget fieldEmail(ContatoFormBack back) {
    return TextFormField(
        validator: back.validaEmail,
        onSaved: (newValue) => back.contato.email = newValue,
        initialValue: back.contato.email,
        decoration: InputDecoration(
            labelText: 'E-Mail:', hintText: 'seuemail@email.com'));
  }

  Widget fieldTelefone(ContatoFormBack back) {
    var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField(
        validator: back.validaTelefone,
        onSaved: (newValue) => back.contato.telefone = newValue,
        initialValue: back.contato.telefone,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Telefone:', hintText: '(99) 9 9999-9999'));
  }

  Widget fieldAvatar(ContatoFormBack back) {
    return TextFormField(
        onSaved: (newValue) => back.contato.urlAvatar = newValue,
        initialValue: back.contato.urlAvatar,
        decoration: InputDecoration(
            labelText: 'Endereço do Avatar:',
            hintText: 'https://cdn.pixabay.com/photo/'));
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContatoFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contato'),
        actions: [
          //Botão Salvar
          IconButton(
              icon: Icon(Icons.save),
              iconSize: 40,
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                if (_back.isValid) {
                  _back.save(context);                  
                }
              })
        ],
      ),
      //Formulario de Cadastro dos Novos Contatos.
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              key: _form,
              child: Column(
                children: [
                  fieldName(_back),
                  fieldEmail(_back),
                  fieldTelefone(_back),
                  fieldAvatar(_back)
                ],
              ))),
    );
  }
}
