import 'dart:convert';

class Publicacion {
  Publicacion({
    required this.id,
    required this.publicacionId,
    required this.descripcion,
    required this.usuario123,
  });

  String id;
  int publicacionId;
  String descripcion;
  String usuario123;

  factory Publicacion.fromJson(String str) =>
      Publicacion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Publicacion.fromMap(Map<String, dynamic> json) => Publicacion(
        id: json["_id"],
        publicacionId: json["publicacionId"],
        descripcion: json["descripcion"],
        usuario123: json["usuario123"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "publicacionId": publicacionId,
        "descripcion": descripcion,
        "usuario123": usuario123,
      };
}
