import 'dart:convert';

import 'package:cotizador/models/models.dart';

class DespachoClass {
    DespachoData? data;

    DespachoClass({
        this.data,
    });

    factory DespachoClass.fromJson(String str) => DespachoClass.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DespachoClass.fromMap(Map<String, dynamic> json) => DespachoClass(
        data: DespachoData.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data!.toMap(),
    };
}

class DespachoData {
    List<GetDespacho>? getDespacho;

    DespachoData({
        this.getDespacho,
    });

    factory DespachoData.fromJson(String str) => DespachoData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DespachoData.fromMap(Map<String, dynamic> json) => DespachoData(
        getDespacho: List<GetDespacho>.from(json["getCompanias"].map((x) => GetDespacho.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "getCompanias": List<dynamic>.from(getDespacho!.map((x) => x.toMap())),
    };
}

