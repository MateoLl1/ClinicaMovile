

import 'package:medi_meet/domain/domain.dart';

class ClinicaRepositoryImpl extends ClinicaRepository {
  
  final ClinicaDatasource datasource;

  ClinicaRepositoryImpl({required this.datasource});
  
  @override
  Future<bool> validarCredenciales(String email, String password) {
    return datasource.validarCredenciales(email, password);
  }

  
  
}