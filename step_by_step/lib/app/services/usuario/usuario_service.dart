import 'dart:convert';

import 'package:step_by_step/app/config/endpoints.dart';
import 'package:step_by_step/app/models/usuario/usuario_model.dart';

class UsuarioService {
  final UsuarioModel usuario;

  UsuarioService({required this.usuario});

  Future<List<dynamic>> getUsers() async {
    try {
      final response = await Endpoints.url.get(Endpoints.api);
      if (response.statusCode == 200) {
        final Map<String, dynamic> files = response.data['files'];
        final String content = files['gistfile1.txt']['content'];

        return jsonDecode(content);
      }
      return [];
    } catch (e) {
      throw Exception("Erro ao Buscar Gists $e");
    }
  }
}
