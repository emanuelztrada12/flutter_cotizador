import 'dart:convert';
import 'package:cotizador/models/models.dart';

class Destination {
    DestinationData? data;

    Destination({
        this.data,
    });

    factory Destination.fromJson(String str) => Destination.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Destination.fromMap(Map<String, dynamic> json) => Destination(
        data: DestinationData.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
    };
}

class DestinationData {
    List<GetDestination>? getDestinations;

    DestinationData({
        this.getDestinations,
    });

    factory DestinationData.fromJson(String str) => DestinationData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DestinationData.fromMap(Map<String, dynamic> json) => DestinationData(
        getDestinations: List<GetDestination>.from(json["getCompanias"].map((x) => GetDestination.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "getCompanias": List<dynamic>.from(getDestinations!.map((x) => x.toMap())),
    };
}

