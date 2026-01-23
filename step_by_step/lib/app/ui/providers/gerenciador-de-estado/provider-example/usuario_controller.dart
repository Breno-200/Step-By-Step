import 'package:flutter/material.dart';
import 'package:step_by_step/app/data/models/usuario/usuario_model.dart';
import 'package:step_by_step/app/data/repositories/usuario/usuario_repository_impl.dart';

class UsuarioController extends ChangeNotifier {
  final UsuarioRepositoryImpl _repository;

  UsuarioController(this._repository);
  bool _isLoading = false;
  List<Usuario> _users = [];
  String? _errorMensagem;

  List<Usuario> get users => _users;
  bool get carregando => _isLoading;
  String? get errorMensagem => _errorMensagem;

  Future<void> listarUsuarios() async {
    _errorMensagem = null;
    _isLoading = true;
    notifyListeners();

    try {
      _users = await _repository.getUsers();
      if (_users.isEmpty) {
        _errorMensagem = 'Nenhum usuário encontrado.';
      }
    } catch (e) {
      debugPrint('Erro encontrado: $e');
      _errorMensagem = 'Algo deu errado! Tente Novamente.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
