


import 'package:dio/dio.dart';
import 'package:medi_meet/config/config.dart';
import 'package:medi_meet/domain/domain.dart';
import 'package:medi_meet/infrastructure/mappers/mappers.dart';
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


  
  @override
  Future<List<EspMedica>> getEspecMedicas()async {
    final response = await dio.get('/admin/esp-med');
    final List<dynamic> data = response.data;
    final List<EspMedica> newEsp = data.map(
      (e) => 
      GetEspMedicasModel.fromJson(e).toEntityEspMedicas()
      ).toList(); 

    return newEsp;
  }
  
  @override
  Future<List<Noticia>> getNoticias()async {
    final response = await dio.get('/admin/news');
    final List<dynamic> newsResponse = response.data;
    final List<Noticia> news = newsResponse.map(
      (e) => GetNoticiasModel.fromJson(e).toEntityNoticia()).toList();
    return news;
  }


  
  
  
}