import 'dart:convert';

import 'package:OTAKUMON/models/inicioproducto.dart';

class InicioproductoResponse {
  InicioproductoResponse({
    required this.inicioproducto,
  });

  List<Inicioproducto> inicioproducto;

  factory InicioproductoResponse.fromJson(String str) =>
      InicioproductoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InicioproductoResponse.fromMap(Map<String, dynamic> json) =>
      InicioproductoResponse(
        inicioproducto: List<Inicioproducto>.from(
            json["inicioproducto"].map((x) => Inicioproducto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "inicioproducto":
            List<dynamic>.from(inicioproducto.map((x) => x.toMap())),
      };
}
