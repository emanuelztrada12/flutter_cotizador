import 'package:flutter/material.dart';

class DespachoProviders extends ChangeNotifier {
  String? _despachoSuggestion;

  String? get despachoSuggestion => _despachoSuggestion ?? '';

  void setDespacho(String despacho) {
    _despachoSuggestion = despacho.isEmpty ? '' : despacho;
    notifyListeners();
  }
}
