import 'dart:convert';

import 'pago.dart';

class ProductoResponse {
    ProductoResponse({
      required  this.pago,
    });

    List<Pago> pago;

    factory ProductoResponse.fromJson(String str) => ProductoResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductoResponse.fromMap(Map<String, dynamic> json) => ProductoResponse(
        pago: List<Pago>.from(json["pago"].map((x) => Pago.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "pago": List<dynamic>.from(pago.map((x) => x.toMap())),
    };
}