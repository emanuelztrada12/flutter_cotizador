import 'dart:convert';
import 'package:cotizador/models/models.dart';

class Search {
    Data data;

    Search({
        required this.data,
    });

    factory Search.fromJson(String str) => Search.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Search.fromMap(Map<String, dynamic> json) => Search(
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data.toMap(),
    };
}

class Data {
    List<SearchDataCompania> getCompanias;

    Data({
        required this.getCompanias,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        getCompanias: List<SearchDataCompania>.from(json["getCompanias"].map((x) => SearchDataCompania.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "getCompanias": List<dynamic>.from(getCompanias.map((x) => x.toMap())),
    };
}

