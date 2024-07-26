import 'dart:io';
import 'package:flutter/material.dart';
import 'package:OTAKUMON/models/inicioproducto.dart';
import 'package:http/http.dart' as http;
import '../models/inicioproducto.dart';
import 'package:OTAKUMON/models/inicioproducto_response.dart';

class InicioproductoProvider extends ChangeNotifier {
  String _baseUrl = '192.168.3.63:9000';

  List<Inicioproducto> listaInicioproductos = [];

  InicioproductoProvider() {
    print('Ingresando a InicioproductoProvider');
    this.getonInicioProductoList();
  }

  getonInicioProductoList() async {
    var url = Uri.http(_baseUrl, '/api/inicioproducto');
    final response = await http.get(url);
    print(response.body);
    final inicioproductoResponse =
        InicioproductoResponse.fromJson(response.body);
    listaInicioproductos = inicioproductoResponse.inicioproducto;
    notifyListeners();
  }

  // guardar
  saveInicioproducto(Inicioproducto inicioproducto) async {
    var url = Uri.http(_baseUrl, 'api/inicioproducto/save');
    print(inicioproducto.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: inicioproducto.toJson());
    print(response);
    getonInicioProductoList();
    notifyListeners();
  }
}
