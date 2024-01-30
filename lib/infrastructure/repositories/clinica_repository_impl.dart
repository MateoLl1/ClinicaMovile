

import 'package:medi_meet/domain/domain.dart';

class ClinicaRepositoryImpl extends ClinicaRepository {
  
  final ClinicaDatasource datasource;

  ClinicaRepositoryImpl({required this.datasource});
  
  @override
  Future<Usuario?> validarCredenciales(String email, String password) {
    return datasource.validarCredenciales(email, password);
  }
  
  @override
  Future<List<EspMedica>> getEspecMedicas() {
    return datasource.getEspecMedicas();
  }
  
  @override
  Future<List<Noticia>> getNoticias() {
    return datasource.getNoticias();
  }

  
  
}