import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'package:cotizador/providers/providers.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  List<Sectore> sectores = [];

  void didChangeDependencies() {
    super.didChangeDependencies();
    final selectedSuggestionProvider = Provider.of<SelectedSuggestionProvider>(context);
    final selectedSuggestion = selectedSuggestionProvider.selectedSuggestion;
    fetchData(selectedSuggestion);
  }

  void fetchData(selectedSuggestion) async {
    try {
      final companiaProvider = Provider.of<CompaniaProviders>(context);
      final newData = await companiaProvider.getSectores(selectedSuggestion ?? '');

      if (newData.isNotEmpty) {
        setState(() {
          sectores = newData[0].sectores!;
        });
      } else {
        setState(() {
          sectores = [];
        });
        print('La lista de datos está vacía');
      }
    } catch (e) {
      print('Error en fetchData: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 448,
          child: DataTable(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xFFF2F2F2),
            ),
            headingRowHeight: 60,
            headingRowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            border: TableBorder.all(
                width: 1,
                color: const Color(0xFFCFD0D3),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            columns: const [
              DataColumn(label: Text('Sector')),
              DataColumn(label: Text('Condición de pago')),
              DataColumn(label: Text('Lista de precio'))
            ],
            rows: List.generate(sectores.length, (index) {
              final sector = sectores[index];
              return DataRow(
                  color: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (index.isEven) {
                      return const Color(0xFFECECEF);
                    }
                    return const Color(0xFFFFFFFF);
                  }),
                  cells: [
                    DataCell(Text(sector.codSector ?? '')),
                    DataCell(Text(sector.condPago ?? '')),
                    DataCell(Text(sector.listaPrecio ?? ''))
                  ]
                );
            }
          ).toList(),
        ),
      )
    );
  }
}
