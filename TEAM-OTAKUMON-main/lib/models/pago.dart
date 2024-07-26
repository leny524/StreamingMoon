import 'dart:convert';

class Pago {
    Pago({
      required  this.id,
      required  this.pagoId,
      required  this.numero,
      required  this.cvc,
      required  this.caducidad,
      required  this.contrasea,
      required  this.titulo,
      required  this.genero,
      required  this.estado,
    });

    String id;
    int pagoId;
    String numero;
    String cvc;
    String caducidad;
    String contrasea;
    String titulo;
    String genero;
    String estado;

    factory Pago.fromJson(String str) => Pago.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Pago.fromMap(Map<String, dynamic> json) => Pago(
        id: json["_id"],
        pagoId: json["pagoID"],
        numero: json["numero"],
        cvc: json["cvc"],
        caducidad: json["caducidad"],
        contrasea: json["contraseña"],
        titulo: json["titulo"],
        genero: json["genero"],
        estado: json["estado"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "pagoID": pagoId,
        "numero": numero,
        "cvc": cvc,
        "caducidad": caducidad,
        "contraseña": contrasea,
        "titulo": titulo,
        "genero": genero,
        "estado": estado,
    };
}
