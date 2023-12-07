import 'dart:convert';

class GetDespacho {
    List<Despacho>? despacho;

    GetDespacho({
        this.despacho,
    });

    factory GetDespacho.fromJson(String str) => GetDespacho.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetDespacho.fromMap(Map<String, dynamic> json) => GetDespacho(
        despacho: List<Despacho>.from(json["despacho"].map((x) => Despacho.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "despacho": List<dynamic>.from(despacho!.map((x) => x.toMap())),
    };
}

class Despacho {
    String? centro;
    List<String>? sectores;

    Despacho({
        this.centro,
        this.sectores,
    });

    factory Despacho.fromJson(String str) => Despacho.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Despacho.fromMap(Map<String, dynamic> json) => Despacho(
        centro: json["centro"],
        sectores: List<String>.from(json["sectores"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "centro": centro,
        "sectores": List<dynamic>.from(sectores!.map((x) => x)),
    };
}
