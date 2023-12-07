import 'package:cotizador/models/models.dart';
import 'package:cotizador/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/despacho_providers.dart';

class BodegaWidget extends StatefulWidget {
  const BodegaWidget({super.key});

  @override
  State<BodegaWidget> createState() => _BodegaWidgetState();
}

class _BodegaWidgetState extends State<BodegaWidget> {
  List<GetBodegas> bodegas = []; 
  void didChangeDependencies() {
    super.didChangeDependencies();
    final suggestionDespacho = Provider.of<DespachoProviders>(context);
    final selectedSuggestion = suggestionDespacho.despachoSuggestion;
    fetchData(selectedSuggestion);
  }

  void fetchData(selectedSuggestion) async {
    for(Despacho despacho in selectedSuggestion){
      print(despacho.centro); 
      final bodegaProvider = Provider.of<CompaniaProviders>(context, listen: false);
      final dataBodega = await bodegaProvider.getBodega(despacho.centro!);
      try {
        setState(() {
          bodegas = dataBodega; 
          print('bodega');
          print(bodegas);

        });
      } catch (e) {
        print(e); 
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Text('data');
  }
}