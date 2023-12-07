import "dart:convert";

class SearchDataCompania {
    String? nombreCompania;
    String? companiaSap;

    SearchDataCompania({
      this.nombreCompania,
      this.companiaSap
    });

    factory SearchDataCompania.fromJson(String str) => SearchDataCompania.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SearchDataCompania.fromMap(Map<String, dynamic> json) => SearchDataCompania(
        nombreCompania: json["nombre_compania"],
        companiaSap: json["compania_sap"]
    );

    Map<String, dynamic> toMap() => {
        "nombre_compania": nombreCompania,
        "compania_sap": companiaSap
    };
}
