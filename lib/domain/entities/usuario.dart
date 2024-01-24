enum Genero { masculino, femenino }

class Usuario {
  final int id;
  final String names;
  final String email;
  final String password;
  final String cedula;
  final String imageUrl;
  final DateTime fechaN;
  final DateTime fechaR;
  final Genero sexo;

  Usuario({
    required this.id,
    required this.names,
    required this.email,
    required this.password,
    required this.cedula,
    required this.imageUrl,
    required this.fechaN,
    required this.fechaR,
    required this.sexo
  });
}
