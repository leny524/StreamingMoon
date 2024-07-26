import 'dart:convert';
//import 'package:OTAKUMON/models/producto_models/producto_rport.dart';
import 'package:OTAKUMON/models/producto_report.dart';
class ProductoReportResponse {
    ProductoReportResponse({
      required  this.productoReport,
    });

    List<ProductoReport> productoReport;

    factory ProductoReportResponse.fromJson(String str) => ProductoReportResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductoReportResponse.fromMap(Map<String, dynamic> json) => ProductoReportResponse(
        productoReport: List<ProductoReport>.from(json["productoReport"].map((x) => ProductoReport.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "productoReport": List<dynamic>.from(productoReport.map((x) => x.toMap())),
    };
}
