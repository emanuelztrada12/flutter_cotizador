import 'dart:convert';
import 'package:cotizador/models/compania.dart';

class CompaniaResponseData {
    DataCompania? data;

    CompaniaResponseData({
        this.data,
    });

    factory CompaniaResponseData.fromJson(String str) => CompaniaResponseData.fromMap(json.decode(str));

    factory CompaniaResponseData.fromMap(Map<String, dynamic> json) => CompaniaResponseData(
        data: DataCompania.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
      "data": data!.toMap(),
    };
}

class DataCompania {
    List<GetCompania>? getCompaniasData;

    DataCompania({
        this.getCompaniasData,
    });

    factory DataCompania.fromJson(String str) => DataCompania.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DataCompania.fromMap(Map<String, dynamic> json) => DataCompania(
        getCompaniasData: List<GetCompania>.from(json["getCompanias"].map((x) => GetCompania.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "getCompanias": List<dynamic>.from(getCompaniasData!.map((x) => x.toMap())),
    };
}

