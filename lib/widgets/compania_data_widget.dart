import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cotizador/providers/providers.dart';

class CompaniaDataWidget extends StatefulWidget {
  const CompaniaDataWidget({Key? key}) : super(key: key);

  @override
  State<CompaniaDataWidget> createState() => _CompaniaDataState();
}

class _CompaniaDataState extends State<CompaniaDataWidget> {
  String correoCompania = '';
  String codigoSap = '';
  String credit = '';
  String country = '';
  String nit = '';

  void didChangeDependencies() {
    super.didChangeDependencies();
    final selectedSuggestionProvider = Provider.of<SelectedSuggestionProvider>(context);
    final selectedSuggestion = selectedSuggestionProvider.selectedSuggestion;
    fetchData(selectedSuggestion);
  }

  void fetchData(selectedSuggestion) async {
    final loadingProvider = Provider.of<LoadingProvider>(context, listen: false);
    try {
      loadingProvider.setLoading(true);
      final companiaProvider = Provider.of<CompaniaProviders>(context);
      final data = await companiaProvider.getData(selectedSuggestion ?? '');

      if (data.isNotEmpty) {
        setState(() {
          correoCompania = data[0].correoCompania ?? '';
          codigoSap = data[0].companiaSap ?? '';
          credit = (data[0].credito?.creditoDisponible ?? '').toString();
          country = (data[0].paisCompania?.nombrePais ?? '').toString();
          nit = data[0].nitCompania ?? '';
        });
      } else {
        setState(() {
          correoCompania = '';
          codigoSap = '';
          credit = '';
          country = '';
          nit = '';
        });
      }
    } catch (e) {
      print('Error en fetchData: $e');
    } finally {
      loadingProvider.setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildInfoColumn('Correo electrónico', correoCompania),
          const SizedBox(width: 5),
          buildInfoColumn('Código SAP', codigoSap),
          const SizedBox(width: 5),
          buildInfoColumn('Crédito disponible', credit),
          const SizedBox(width: 5),
          buildInfoColumn('País', country),
          const SizedBox(width: 5),
          buildInfoColumn('NIT', nit),
          const SizedBox(width: 5),
        ],
      ),
    );
  }

  Widget buildInfoColumn(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            '$label:',
            style: const TextStyle(fontFamily: 'MarkProBold', fontSize: 15),
          ),
          Text(value),
        ],
      ),
    );
  }
}

