import 'package:flutter/material.dart';

class SelectedSuggestionProvider extends ChangeNotifier {
  String? _selectedSuggestion;

  String? get selectedSuggestion => _selectedSuggestion ?? '';

  void setSelectedSuggestion(String suggestion) {
    _selectedSuggestion = suggestion.isEmpty ? '' : suggestion;
    notifyListeners();
  }
}
