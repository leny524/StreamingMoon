import 'dart:convert';

class ProductoReport {
    ProductoReport({
      required  this.id,
      required  this.count,
    });

    String id;
    int count;

    factory ProductoReport.fromJson(String str) => ProductoReport.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductoReport.fromMap(Map<String, dynamic> json) => ProductoReport(
        id: json["_id"],
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
    };
}
