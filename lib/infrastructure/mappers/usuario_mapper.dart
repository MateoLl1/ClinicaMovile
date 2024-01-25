import 'package:medi_meet/domain/domain.dart';
import 'package:medi_meet/infrastructure/models/get_usuario_model.dart';

class UsuarioMapper {
  static Usuario toEntityUsuario(GetUsuarioModel user) => Usuario(
    id: user.emId,
    names: user.emNombres,
    email: user.emCedula,
    password: user.emPassword,
    cedula: user.emCedula,
    imageUrl: user.emImagen,
    fechaN: user.emFechaNa,
    fechaR: user.emFechaReg,
    sexo: (user.emSexo == 'M') ? Genero.masculino : Genero.femenino,
    status: Estado.validado
  );
}
