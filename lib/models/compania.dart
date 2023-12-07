import 'dart:convert';

class GetCompania {
  String? companiaSap;
  String? correoCompania;
  String? nitCompania; 
  Credito? credito;
  PaisCompania? paisCompania;

  GetCompania({
    this.companiaSap,
    this.correoCompania,
    this.nitCompania,
    this.credito,
    this.paisCompania,
  });

  factory GetCompania.fromJson(String str) => GetCompania.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetCompania.fromMap(Map<String, dynamic> json) => GetCompania(
    companiaSap: json["compania_sap"],
    correoCompania: json["correo_compania"],
    nitCompania: json["nit_compania"],
    credito: json["credito"] != null ? Credito.fromMap(json["credito"]) : null,
    paisCompania: PaisCompania.fromMap(json["pais_compania"]),
  );

  Map<String, dynamic> toMap() => {
    "compania_sap": companiaSap,
    "correo_compania": correoCompania,
    "nit_compania": nitCompania,
    "credito": credito?.toMap(),
    "pais_compania": paisCompania?.toMap(),
  };
}

class Credito {
  String? creditoDisponible;

  Credito({
    this.creditoDisponible,
  });

  factory Credito.fromJson(String str) => Credito.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Credito.fromMap(Map<String, dynamic> json) => Credito(
      creditoDisponible: json["CreditoDisponible"],
  );

  Map<String, dynamic> toMap() => {
    "CreditoDisponible": creditoDisponible,
  };
}

class PaisCompania {
  String nombrePais;

  PaisCompania({
    required this.nombrePais,
  });

  factory PaisCompania.fromJson(String str) => PaisCompania.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaisCompania.fromMap(Map<String, dynamic> json) => PaisCompania(
      nombrePais: json["nombre_pais"],
  );

  Map<String, dynamic> toMap() => {
      "nombre_pais": nombrePais,
  };
}