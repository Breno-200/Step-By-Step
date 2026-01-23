import 'package:step_by_step/app/data/models/usuario/usuario_model.dart';

abstract class UsuarioInterface {
  Future<Usuario> getUserById(int id);
  Future<List<Usuario>> getUsers(int id);
  Future<Usuario> postUser(Usuario usuario);
  Future<Usuario> putUser(int id, Usuario usuario);
  Future<bool> deleteUser(int id);
}
