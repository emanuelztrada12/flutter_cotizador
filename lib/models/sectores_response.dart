import 'dart:convert';
import 'package:cotizador/models/sectores.dart';

class Sectores {
    DataSectores? data;

    Sectores({
        this.data,
    });

    factory Sectores.fromJson(String str) => Sectores.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Sectores.fromMap(Map<String, dynamic> json) => Sectores(
        data: DataSectores.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data!.toMap(),
    };
}

class DataSectores {
    List<GetCompaniaSectores>? getCompaniasSectores;

    DataSectores({
        this.getCompaniasSectores,
    });

    factory DataSectores.fromJson(String str) => DataSectores.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DataSectores.fromMap(Map<String, dynamic> json) => DataSectores(
        getCompaniasSectores: List<GetCompaniaSectores>.from(json["getCompanias"].map((x) => GetCompaniaSectores.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "getCompanias": List<dynamic>.from(getCompaniasSectores!.map((x) => x.toMap())),
    };
}



