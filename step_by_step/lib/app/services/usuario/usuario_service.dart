
import 'package:step_by_step/app/interface/usuario_interface.dart';
import 'package:step_by_step/app/models/usuario/usuario_model.dart';

class UsuarioService implements UsuarioInterface{
  final Usuario usuario;

  UsuarioService({required this.usuario});
  
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
  Future<List<Usuario>> getUsers(int id) {
    // TODO: implement getUsers
    throw UnimplementedError();
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
