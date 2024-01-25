


import 'package:medi_meet/domain/domain.dart';

abstract class ClinicaDatasource {

  Future<Usuario?> validarCredenciales(String email,String password);
  
 
}