




import 'package:medi_meet/domain/domain.dart';

abstract class ClinicaRepository {

  Future<Usuario?> validarCredenciales(String email,String password);

  Future<Usuario?> registarUsuario(Usuario user);
  
  Future<List<EspMedica>> getEspecMedicas();

  Future<List<Noticia>> getNoticias();
}