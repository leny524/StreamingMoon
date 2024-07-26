import 'dart:convert';

class Producto {
    Producto({
        required this.id,
        required this.productoId,
        required this.descripcion,
        required this.precio,
        required this.imagen,
        required this.genero,
        required this.estado,
    });

    String id;
    int productoId;
    String descripcion;
    double precio;
    String imagen;
    String genero;
    String estado;

    factory Producto.fromJson(String str) => Producto.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Producto.fromMap(Map<String, dynamic> json) => Producto(
        id: json["_id"],
        productoId: json["productoID"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        imagen: json["imagen"],
        genero: json["genero"],
        estado: json["estado"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "productoID": productoId,
        "descripcion": descripcion,
        "precio": precio,
        "imagen": imagen,
        "genero": genero,
        "estado": estado,
    };
}
