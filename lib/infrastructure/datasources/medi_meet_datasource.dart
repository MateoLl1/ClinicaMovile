


import 'package:dio/dio.dart';
import 'package:medi_meet/config/config.dart';
import 'package:medi_meet/domain/domain.dart';
import 'package:medi_meet/infrastructure/mappers/usuario_mapper.dart';
import 'package:medi_meet/infrastructure/models/models.dart';

class MediMeetDatasource extends ClinicaDatasource {
  
  final dio = Dio(
    BaseOptions(baseUrl: Environment.apiHost)
  );

  @override
  Future<Usuario?> validarCredenciales(String email, String password) async{
    try {
      final response = await dio.post('/auth/login',data: {
    'email' : email,
    'password' : password,
    });
    final responseModel = GetUsuarioModel.fromJson(response.data[0]);
    return UsuarioMapper.toEntityUsuario(responseModel);
    } catch (e) {
      return null;
    }
  }


  
  
  
}