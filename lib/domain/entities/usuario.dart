enum Genero { masculino, femenino }
enum Estado { validado , invalido  }

class Usuario {
  final int? id;
  final String names;
  final String email;
  final String? password;
  final String cedula;
  final String? imageUrl;
  final String fechaN;
  final DateTime? fechaR;
  final Genero sexo;
  final Estado? status;

  Usuario({
    this.id,
    required this.names,
    required this.email,
    this.password,
    required this.cedula,
     this.imageUrl,
    required this.fechaN,
    this.fechaR,
    required this.sexo,
    this.status
  });
}
