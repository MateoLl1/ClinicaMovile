


import 'package:dio/dio.dart';
import 'package:medi_meet/config/config.dart';
import 'package:medi_meet/domain/domain.dart';

class MediMeetDatasource extends ClinicaDatasource {
  
  final dio = Dio(
    BaseOptions(baseUrl: Environment.apiHost)
  );

  @override
  Future<String> validarCredenciales(String email, String password) async{
  try {
      final response = await dio.post('/auth/login',data: {
      'email' : email,
      'password' : password,
      });
      if (response.data.isEmpty) {
        return 'Credenciales incorrectas';
      } else {
        return 'Bienvenido';
      }
    } catch (e) {
      return 'Error de conexion';
    }
  }
  
  
  
}