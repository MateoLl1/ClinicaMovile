




import 'package:medi_meet/domain/domain.dart';

abstract class ClinicaRepository {

  Future<Usuario?> validarCredenciales(String email,String password);
}