import 'package:medi_meet/domain/domain.dart';

class GetEspMedicasModel {
  final int spMeId;
  final String spMeNombre;
  final DateTime spMeFechaReg;
  final String spMeImagen;
  final String spMeDescr;
  final String spMeImagen2;
  final String spMeSubTi;
  final String spMeParrafo;
  final String spMeIcon;

  GetEspMedicasModel({
    required this.spMeId,
    required this.spMeNombre,
    required this.spMeFechaReg,
    required this.spMeImagen,
    required this.spMeDescr,
    required this.spMeImagen2,
    required this.spMeSubTi,
    required this.spMeParrafo,
    required this.spMeIcon,
  });

  factory GetEspMedicasModel.fromJson(Map<String, dynamic> json) =>
      GetEspMedicasModel(
        spMeId: json["sp_me_id"],
        spMeNombre: json["sp_me_nombre"],
        spMeFechaReg: DateTime.parse(json["sp_me_fecha_reg"]),
        spMeImagen: json["sp_me_imagen"],
        spMeDescr: json["sp_me_descr"],
        spMeImagen2: json["sp_me_imagen2"],
        spMeSubTi: json["sp_me_sub_ti"],
        spMeParrafo: json["sp_me_parrafo"],
        spMeIcon: json["sp_me_icon"],
      );

  EspMedica toEntityEspMedicas() => EspMedica(
    id: spMeId,
    name: spMeNombre,
    imagen1: spMeImagen,
    descripcion: spMeDescr,
    subTitle: spMeSubTi,
    parrafo: spMeParrafo,
    imagen2: spMeImagen2,
    iconUrl: spMeIcon,
    fechaReg: spMeFechaReg
  );
}
