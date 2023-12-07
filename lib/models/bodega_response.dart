import 'dart:convert';

import 'package:cotizador/models/models.dart';

class BodegaClass {
  BodegaData? data;

  BodegaClass({
    this.data,
  });

  factory BodegaClass.fromJson(String str) =>
      BodegaClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BodegaClass.fromMap(Map<String, dynamic> json) => BodegaClass(
        data: BodegaData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data!.toMap(),
      };
}

class BodegaData {
  List<GetBodegas>? getBodegas;

  BodegaData({
    this.getBodegas,
  });

  factory BodegaData.fromJson(String str) =>
      BodegaData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BodegaData.fromMap(Map<String, dynamic> json) => BodegaData(
        getBodegas: List<GetBodegas>.from(
            json["getBodegas"].map((x) => GetBodegas.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "getBodegas": List<dynamic>.from(getBodegas!.map((x) => x.toMap())),
      };
}
