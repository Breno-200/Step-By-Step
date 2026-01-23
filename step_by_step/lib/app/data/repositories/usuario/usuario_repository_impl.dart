import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:step_by_step/app/core/config/endpoints.dart';
import 'package:step_by_step/app/domain/repositories/usuario/iusuario_repository.dart';
import 'package:step_by_step/app/data/models/usuario/usuario_model.dart';

class UsuarioRepositoryImpl implements UsuarioInterface {
  final Dio _dio = Endpoints.url;
  final String? _idGist = dotenv.env['IDGIST'];

  @override
  Future<bool> deleteUser(int id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Usuario> getUserById(int id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<List<Usuario>> getUsers() async {
    try {
      final response = await _dio.get('$_idGist');
      if (response.statusCode == 200) {
        final files = response.data['files'];
        final String content = files['user.json']['content'];

        final List<dynamic> decodedData = jsonDecode(content);
        return decodedData.map((e) => Usuario.fromMap(e)).toList();
      } else {
        throw Exception('Erro: ${response.statusCode}');
      }
    } on DioException catch (e) {
      debugPrint('Erro no Dio ${e.message}');
      return [];
    } catch (e) {
      debugPrint('Erro inesperado $e}');
      return [];
    }
  }

  @override
  Future<Usuario> postUser(Usuario usuario) {
    // TODO: implement postUser
    throw UnimplementedError();
  }

  @override
  Future<Usuario> putUser(int id, Usuario usuario) {
    // TODO: implement putUser
    throw UnimplementedError();
  }
}
