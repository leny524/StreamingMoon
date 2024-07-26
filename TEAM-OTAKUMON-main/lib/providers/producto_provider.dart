//import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:OTAKUMON/models/producto_response.dart';
import '../models/producto.dart';
import 'package:http/http.dart' as http;

import '../models/producto_report.dart';
import '../models/producto_report_response.dart';

class ProductoProvider extends ChangeNotifier {
  String _baseUrl = '192.168.3.63:9000';
// String _baseUrl = '192.168.3.63:9000';

  List<Producto> listaProductos = [];
  List<ProductoReport> listaProductoReport = [];

  ProductoProvider() {
    print("ingresando a producto Provider");
    this.getOnProductoList();
  }

  getOnProductoList() async {
    var url = Uri.http(_baseUrl, '/api/productos', {});
    final response = await http.get(url);
    print(response.body);
    final productoResponse = ProductoResponse.fromJson(response.body);
    listaProductos = productoResponse.productos;
    notifyListeners();
  }
  saveProducto(Producto producto) async {
    var url = Uri.http(_baseUrl, '/api/producto/save');
    print(producto.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: producto.toJson());
    print(response);
    getOnProductoList();
    reporteProducto();
    notifyListeners();
  }

  reporteProducto() async {
    var url = Uri.http(_baseUrl, '/api/reportes/productoReport');
    final response = await http.get(url);
    final productoReportResponse =
        ProductoReportResponse.fromJson(response.body);
    listaProductoReport = productoReportResponse.productoReport;
    notifyListeners();
  }
}
