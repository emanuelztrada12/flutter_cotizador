import 'dart:convert';

class GetBodegas {
    int? bodegaId;
    String? bodegaSap;
    String? nombreBodega;
    int? estadoBodega;
    int? paisBodega;
    String? tipoBodega;
    String? region;
    String? ciudad;
    String? direccion;
    dynamic codigoPostal;
    ReglaDespacho? reglaDespacho;

    GetBodegas({
        this.bodegaId,
        this.bodegaSap,
        this.nombreBodega,
        this.estadoBodega,
        this.paisBodega,
        this.tipoBodega,
        this.region,
        this.ciudad,
        this.direccion,
        this.codigoPostal,
        this.reglaDespacho,
    });

    factory GetBodegas.fromJson(String str) => GetBodegas.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetBodegas.fromMap(Map<String, dynamic> json) => GetBodegas(
        bodegaId: json["bodega_id"],
        bodegaSap: json["bodega_sap"],
        nombreBodega: json["nombre_bodega"],
        estadoBodega: json["estado_bodega"],
        paisBodega: json["pais_bodega"],
        tipoBodega: json["tipo_bodega"],
        region: json["region"],
        ciudad: json["ciudad"],
        direccion: json["direccion"],
        codigoPostal: json["codigo_postal"],
        reglaDespacho: ReglaDespacho.fromMap(json["regla_despacho"]),
    );

    Map<String, dynamic> toMap() => {
        "bodega_id": bodegaId,
        "bodega_sap": bodegaSap,
        "nombre_bodega": nombreBodega,
        "estado_bodega": estadoBodega,
        "pais_bodega": paisBodega,
        "tipo_bodega": tipoBodega,
        "region": region,
        "ciudad": ciudad,
        "direccion": direccion,
        "codigo_postal": codigoPostal,
        "regla_despacho": reglaDespacho!.toMap(),
    };
}

class ReglaDespacho {
    int? dias;
    String? hora;

    ReglaDespacho({
        this.dias,
        this.hora,
    });

    factory ReglaDespacho.fromJson(String str) => ReglaDespacho.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ReglaDespacho.fromMap(Map<String, dynamic> json) => ReglaDespacho(
        dias: json["dias"],
        hora: json["hora"],
    );

    Map<String, dynamic> toMap() => {
        "dias": dias,
        "hora": hora,
    };
}
