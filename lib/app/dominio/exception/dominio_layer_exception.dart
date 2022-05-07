//import 'dart:html';

class DominioLayerException implements Exception {
  String causa;

  DominioLayerException(this.causa);

  @override
  String toString() {
    return causa;
  }
}
