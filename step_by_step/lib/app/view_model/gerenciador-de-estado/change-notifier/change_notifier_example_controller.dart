import 'package:flutter/material.dart';

class ChangeNotifierExampleController extends ChangeNotifier {
  final List<String> _nome = [];
  List<String> get nome => _nome;

  void adicionarNome({required String nome}) {
    _nome.add(nome);
    notifyListeners();
  }

  void removerNome({required String nome}) {
    _nome.remove(nome);
    notifyListeners();
  }
}
