

class GetUsuarioModel {
    final int emId;
    final String emEmail;
    final String emPassword;
    final String emCedula;
    final String emNombres;
    final DateTime emFechaNa;
    final String emImagen;
    final DateTime emFechaReg;
    final String emSexo;
    final String emEstado;
    final int tpEmId;

    GetUsuarioModel({
        required this.emId,
        required this.emEmail,
        required this.emPassword,
        required this.emCedula,
        required this.emNombres,
        required this.emFechaNa,
        required this.emImagen,
        required this.emFechaReg,
        required this.emSexo,
        required this.emEstado,
        required this.tpEmId,
    });

    factory GetUsuarioModel.fromJson(Map<String, dynamic> json) => GetUsuarioModel(
        emId: json["em_id"],
        emEmail: json["em_email"],
        emPassword: json["em_password"],
        emCedula: json["em_cedula"],
        emNombres: json["em_nombres"],
        emFechaNa: DateTime.parse(json["em_fecha_na"]),
        emImagen: json["em_imagen"],
        emFechaReg: DateTime.parse(json["em_fecha_reg"]),
        emSexo: json["em_sexo"],
        emEstado: json["em_estado"],
        tpEmId: json["tp_em_id"],
    );

    Map<String, dynamic> toJson() => {
        "em_id": emId,
        "em_email": emEmail,
        "em_password": emPassword,
        "em_cedula": emCedula,
        "em_nombres": emNombres,
        "em_fecha_na": emFechaNa.toIso8601String(),
        "em_imagen": emImagen,
        "em_fecha_reg": emFechaReg.toIso8601String(),
        "em_sexo": emSexo,
        "em_estado": emEstado,
        "tp_em_id": tpEmId,
    };
}
