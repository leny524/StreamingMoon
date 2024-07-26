import 'dart:convert';

class Inicioproducto {
  Inicioproducto({
    required this.id,
    required this.inicioproductoId,
    required this.titulo,
    required this.descripcion,
    required this.imagen,
    required this.precio,
  });

  String id;
  int inicioproductoId;
  String titulo;
  String descripcion;
  String imagen;
  int precio;

  factory Inicioproducto.fromJson(String str) =>
      Inicioproducto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Inicioproducto.fromMap(Map<String, dynamic> json) => Inicioproducto(
        id: json["_id"],
        inicioproductoId: json["inicioproductoId"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        precio: json["precio"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "inicioproductoId": inicioproductoId,
        "titulo": titulo,
        "descripcion": descripcion,
        "imagen": imagen,
        "precio": precio,
      };
}
