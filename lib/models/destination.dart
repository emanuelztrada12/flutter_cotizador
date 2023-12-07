import 'dart:convert';

class GetDestination {
    String? nombreCompania;
    String? nitCompania;
    List<Destinatario>? destinatarios;

    GetDestination({
        this.nombreCompania,
        this.nitCompania,
        this.destinatarios,
    });

    factory GetDestination.fromJson(String str) => GetDestination.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetDestination.fromMap(Map<String, dynamic> json) => GetDestination(
        nombreCompania: json["nombre_compania"],
        nitCompania: json["nit_compania"],
        destinatarios: List<Destinatario>.from(json["destinatarios"].map((x) => Destinatario.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "nombre_compania": nombreCompania,
        "nit_compania": nitCompania,
        "destinatarios": List<dynamic>.from(destinatarios!.map((x) => x.toMap())),
    };
}

class Destinatario {
    int? destinatarioId;
    String? destinatarioSap;
    String? ciudad;
    String? departamento;
    String? zip;
    String? telefonoDestinatario;
    String? detalle;
    dynamic punto;
    int? estadoId;

    Destinatario({
        this.destinatarioId,
        this.destinatarioSap,
        this.ciudad,
        this.departamento,
        this.zip,
        this.telefonoDestinatario,
        this.detalle,
        this.punto,
        this.estadoId,
    });

    factory Destinatario.fromJson(String str) => Destinatario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Destinatario.fromMap(Map<String, dynamic> json) => Destinatario(
        destinatarioId: json["destinatario_id"],
        destinatarioSap: json["destinatario_sap"],
        ciudad: json["ciudad"],
        departamento: json["departamento"],
        zip: json["zip"],
        telefonoDestinatario: json["telefono_destinatario"],
        detalle: json["detalle"],
        punto: json["punto"],
        estadoId: json["estado_id"],
    );

    Map<String, dynamic> toMap() => {
        "destinatario_id": destinatarioId,
        "destinatario_sap": destinatarioSap,
        "ciudad": ciudad,
        "departamento": departamento,
        "zip": zip,
        "telefono_destinatario": telefonoDestinatario,
        "detalle": detalle,
        "punto": punto,
        "estado_id": estadoId,
    };
}
