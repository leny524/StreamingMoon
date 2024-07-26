import 'dart:io';

import 'package:OTAKUMON/models/publicacion.dart';
import 'package:OTAKUMON/models/publicacion_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PublicacionProvider extends ChangeNotifier {
  String _baseUrl = '192.168.3.63:9000';
  // String _baseUrl = '192.168.3.63:9000';
  // String _baseUrl = '192.168.0.19:3999';
  List<Publicacion> listaPublicaciones = [];

  PublicacionProvider() {
    print('Ingresando a PublicacionProvider');
    this.getOnPublicacioneList();
  }

  getOnPublicacioneList() async {
    var url = Uri.http(_baseUrl, '/api/publicaciones');
    final response = await http.get(url);
    print(response.body);
    final publicacionResponse = PublicacionResponse.fromJson(response.body);
    listaPublicaciones = publicacionResponse.publicaciones;
    notifyListeners();
  }

  // guardar
  savePublicacion(Publicacion publicacion) async {
    var url = Uri.http(_baseUrl, 'api/publicaciones/save');
    print(publicacion.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: publicacion.toJson());
    print(response);
    getOnPublicacioneList();
    notifyListeners();
  }
}
