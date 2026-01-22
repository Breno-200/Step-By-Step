import 'dart:convert';

class UsuarioModel {
  final int id;
  final String nomeCompleto;
  final String nomeUsuario;
  final String email;
  final String senha;

  UsuarioModel({
    required this.id,
    required this.nomeCompleto,
    required this.nomeUsuario,
    required this.email,
    required this.senha,
  });

  UsuarioModel copyWith({
    int? id,
    String? nomeCompleto,
    String? nomeUsuario,
    String? email,
    String? senha,
  }) {
    return UsuarioModel(
      id: id ?? this.id,
      nomeCompleto: nomeCompleto ?? this.nomeCompleto,
      nomeUsuario: nomeUsuario ?? this.nomeUsuario,
      email: email ?? this.email,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome_completo': nomeCompleto,
      'nome_usuario': nomeUsuario,
      'email': email,
      'senha': senha,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'] as int,
      nomeCompleto: map['nome_completo'] as String,
      nomeUsuario: map['nome_usuario'] as String,
      email: map['email'] as String,
      senha: map['senha'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) => UsuarioModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UsuarioModel(id: $id, nomeCompleto: $nomeCompleto, nomeUsuario: $nomeUsuario, email: $email, senha: $senha)';
  }

  @override
  bool operator ==(covariant UsuarioModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nomeCompleto == nomeCompleto &&
      other.nomeUsuario == nomeUsuario &&
      other.email == email &&
      other.senha == senha;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nomeCompleto.hashCode ^
      nomeUsuario.hashCode ^
      email.hashCode ^
      senha.hashCode;
  }
}
