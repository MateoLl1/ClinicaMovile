


import 'package:dio/dio.dart';
import 'package:medi_meet/config/config.dart';
import 'package:medi_meet/domain/domain.dart';

class MediMeetDatasource extends ClinicaDatasource {
  
  final dio = Dio(
    BaseOptions(baseUrl: Environment.apiHost)
  );

  @override
  Future<bool> validarCredenciales(String email, String password) async{
    final response = await dio.post('/auth/login',data: {
      'email' : email,
      'password' : password,
    });
    print(response.data);
    throw UnimplementedError();
  }
  
  
  
}