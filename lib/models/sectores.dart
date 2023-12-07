import 'dart:convert';

class GetCompaniaSectores {
    List<Sectore>? sectores;

    GetCompaniaSectores({
        this.sectores,
    });

    factory GetCompaniaSectores.fromJson(String str) => GetCompaniaSectores.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetCompaniaSectores.fromMap(Map<String, dynamic> json) => GetCompaniaSectores(
        sectores: List<Sectore>.from(json["sectores"].map((x) => Sectore.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "sectores": List<dynamic>.from(sectores!.map((x) => x.toMap())),
    };
}

class Sectore {
    String? codSector;
    String? nombre;
    String? listaPrecio;
    String? condPago;

    Sectore({
        this.codSector,
        this.nombre,
        this.listaPrecio,
        this.condPago,
    });

    factory Sectore.fromJson(String str) => Sectore.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Sectore.fromMap(Map<String, dynamic> json) => Sectore(
        codSector: json["CodSector"],
        nombre: json["Nombre"],
        listaPrecio: json["ListaPrecio"],
        condPago: json["CondPago"],
    );

    Map<String, dynamic> toMap() => {
        "CodSector": codSector,
        "Nombre": nombre,
        "ListaPrecio": listaPrecio,
        "CondPago": condPago,
    };
}