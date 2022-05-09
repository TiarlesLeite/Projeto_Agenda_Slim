// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_lista_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContatoListaBack on _ContatoListaBack, Store {
  final _$listaAtom = Atom(name: '_ContatoListaBack.lista');

  @override
  Future<List<Contato>> get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(Future<List<Contato>> value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  final _$_ContatoListaBackActionController =
      ActionController(name: '_ContatoListaBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_ContatoListaBackActionController.startAction(
        name: '_ContatoListaBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ContatoListaBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lista: ${lista}
    ''';
  }
}
