//import 'dart:html';

class DominioDaException implements Exception {
  String causa;

  DominioDaException(this.causa);

  @override
  String toString() {
    return causa;
  }
}
