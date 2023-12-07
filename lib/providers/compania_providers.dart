import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cotizador/models/models.dart';

class CompaniaProviders extends ChangeNotifier {
  List<SearchDataCompania>? _allSearchData;

  CompaniaProviders() {
    print('Compania inicializado');
  }

  Future<void> loadAllSearchData() async {
    var filtro = {"usuario_vendedor": "paraDevs"};

    var query = r'''
    query ($filtro: CompaniaFilter!) {
      getCompanias(filtro: $filtro) {
        nombre_compania,
        compania_sap
      }
    }
    ''';

    var headers = {'Content-Type': 'application/json'};
    query = query.replaceAll(RegExp(r'\s+'), ' ');

    var url = Uri.parse('https://cambiagro.store/offikio/graphql/compania?query=${Uri.encodeQueryComponent(query)}&variables=${jsonEncode({"filtro": filtro})}');

    final response = await http.get(url, headers: headers);
    final dataCompania = Search.fromJson(response.body);
    _allSearchData = dataCompania.data.getCompanias;
  }

  Future<List<SearchDataCompania>> getSearchData(String param) async {
    if (_allSearchData == null) {
      await loadAllSearchData();
    }

    if (param.isEmpty) {
      return _allSearchData ?? [];
    }

    return _allSearchData!
      .where((searchData) =>
          searchData.nombreCompania!.toLowerCase().contains(param.toLowerCase()) ||
          searchData.companiaSap!.toLowerCase().contains(param.toLowerCase()))
      .toList();
  }

  Future<List<GetCompania>> getData(String filter) async {
    if(filter.isEmpty) {
      return []; 
    }

    var filtro = {
      "companias_like": filter,
      "getCredito": true
    }; 

    var query = r'''
    query ($filtro: CompaniaFilter!) {
      getCompanias(filtro: $filtro) {
        compania_sap
        correo_compania
        credito
        nit_compania
        pais_compania {
          nombre_pais
        }
      }
    }
    '''; 

    var headers = {'Content-Type': 'application/json'};
    query = query.replaceAll(RegExp(r'\s+'), ' ');

    var url = Uri.parse('https://cambiagro.store/offikio/graphql/compania?query=${Uri.encodeQueryComponent(query)}&variables=${jsonEncode({"filtro": filtro})}');
    final response = await http.get(url, headers: headers);
    final dataCompania = CompaniaResponseData.fromJson(response.body);
    return dataCompania.data!.getCompaniasData!;
  }

  Future<List<GetCompaniaSectores>> getSectores(String filter) async {
    if(filter.isEmpty) {
      return []; 
    }

    var filtro = {
      "companias_like": filter,
      "getSectores": true
    }; 

    var query = r'''
    query ($filtro: CompaniaFilter!) {
      getCompanias(filtro: $filtro) {
        sectores
      }
    }
    '''; 


    var headers = {'Content-Type': 'application/json'};
    query = query.replaceAll(RegExp(r'\s+'), ' ');

    var url = Uri.parse('https://cambiagro.store/offikio/graphql/compania?query=${Uri.encodeQueryComponent(query)}&variables=${jsonEncode({"filtro": filtro})}');
    final response = await http.get(url, headers: headers);
    final dataCompania = Sectores.fromJson(response.body);
    return dataCompania.data!.getCompaniasSectores!;
  }

   Future<List<GetDestination>> getDestination(String filter) async {
    if(filter.isEmpty) {
      return []; 
    }

    var filtro = {
      "companias_like": filter
    }; 

    var query = r'''
    query ($filtro: CompaniaFilter!) {
      getCompanias(filtro: $filtro) {
        nombre_compania
        nit_compania
        destinatarios {
          destinatario_id
          destinatario_sap
          ciudad
          departamento
          zip
          telefono_destinatario
          detalle
          punto
          estado_id
        }
      }
    }
    '''; 

    var headers = {'Content-Type': 'application/json'};
    query = query.replaceAll(RegExp(r'\s+'), ' ');

    var url = Uri.parse('https://cambiagro.store/offikio/graphql/compania?query=${Uri.encodeQueryComponent(query)}&variables=${jsonEncode({"filtro": filtro})}');
    final response = await http.get(url, headers: headers);
    final dataCompania = Destination.fromJson(response.body);
    return dataCompania.data!.getDestinations!;
  }

  Future<List<GetDespacho>> getDespacho(String filter) async {
    if(filter.isEmpty) {
      return []; 
    }

    var filtro = {
      "companias_like": filter
    }; 

    var query = r'''
    query ($filtro: CompaniaFilter!) {
      getCompanias(filtro: $filtro) {
        despacho
      }
    }
    '''; 

    var headers = {'Content-Type': 'application/json'};
    query = query.replaceAll(RegExp(r'\s+'), ' ');

    var url = Uri.parse('https://cambiagro.store/offikio/graphql/compania?query=${Uri.encodeQueryComponent(query)}&variables=${jsonEncode({"filtro": filtro})}');
    final response = await http.get(url, headers: headers);
    final dataCompania = DespachoClass.fromJson(response.body);
    print(dataCompania); 
    return dataCompania.data!.getDespacho!;
  }

  Future<List<GetBodegas>> getBodega(String filter) async {
    if(filter.isEmpty) {
      return []; 
    }

    var filtro = {
      "tipo": null,
      "pais": null,
      "bodegaSap": filter
    }; 

    var query = r'''
    query GetBodegas($tipo: String, $pais: String, $bodegaSap: String) {
      getBodegas(tipo: $tipo, pais: $pais, bodega_sap: $bodegaSap) {
        bodega_id
        bodega_sap
        nombre_bodega
        estado_bodega
        pais_bodega
        tipo_bodega
        region
        ciudad
        direccion
        codigo_postal
        regla_despacho
      }
    }
    '''; 

    var headers = {'Content-Type': 'application/json'};
    query = query.replaceAll(RegExp(r'\s+'), ' ');

    var url = Uri.parse('https://cambiagro.store/offikio/graphql/getBodegas?query=${Uri.encodeQueryComponent(query)}&variables=${jsonEncode({filtro})}');
    final response = await http.get(url, headers: headers);
    final dataCompania = BodegaClass.fromJson(response.body);
    return dataCompania.data!.getBodegas!;
  }
}
