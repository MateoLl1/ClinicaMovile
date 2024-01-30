import 'package:medi_meet/domain/domain.dart';

class GetNoticiasModel {
  final int newId;
  final String newTitulo;
  final String newContent;
  final String newImage;
  final DateTime newFecha;
  final dynamic emId;

  GetNoticiasModel({
    required this.newId,
    required this.newTitulo,
    required this.newContent,
    required this.newImage,
    required this.newFecha,
    required this.emId,
  });

  factory GetNoticiasModel.fromJson(Map<String, dynamic> json) =>
      GetNoticiasModel(
        newId: json["new_id"],
        newTitulo: json["new_titulo"],
        newContent: json["new_content"],
        newImage: json["new_image"],
        newFecha: DateTime.parse(json["new_fecha"]),
        emId: json["em_id"],
      );

  Noticia toEntityNoticia() => Noticia(
    id: newId,
    title: newTitulo, 
    content: newContent, 
    imageUrl: newImage
  );
}
