import 'dart:convert';

import 'package:OTAKUMON/models/publicacion.dart';

class PublicacionResponse {
  PublicacionResponse({
    required this.publicaciones,
  });

  List<Publicacion> publicaciones;

  factory PublicacionResponse.fromJson(String str) =>
      PublicacionResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PublicacionResponse.fromMap(Map<String, dynamic> json) =>
      PublicacionResponse(
        publicaciones: List<Publicacion>.from(
            json["publicaciones"].map((x) => Publicacion.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "publicaciones":
            List<dynamic>.from(publicaciones.map((x) => x.toMap())),
      };
}
