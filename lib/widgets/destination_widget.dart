import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cotizador/providers/providers.dart';
import 'package:cotizador/models/models.dart';
import 'package:cotizador/widgets/widgets.dart';

const List<Widget> order = <Widget>[
  Text('A domicilio'),
  Text('Retiro en planta'),
];

class DestinationWidget extends StatefulWidget {
  const DestinationWidget({super.key});

  @override
  State<DestinationWidget> createState() => _DestinationWidgetState();
}

class _DestinationWidgetState extends State<DestinationWidget> {
  final List<bool> _selectedOptions = <bool>[true, false];
  String? selectedDestinatario = 'N/A';
  List<Destinatario> destinatarios = [];
  String nombreCompania = ''; 
  String nitCompania = ''; 

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
      final data = await companiaProvider.getDestination(selectedSuggestion ?? '');
      final suggestionDespacho = Provider.of<DespachoProviders>(context, listen: false);
      final dataDespacho = await companiaProvider.getDespacho(selectedSuggestion ?? ''); 
      // dataDespacho[0].despacho!

      if (data.isNotEmpty) {
        setState(() {
          destinatarios = data[0].destinatarios!; 
          nombreCompania = data[0].nombreCompania!; 
          nitCompania = data[0].nitCompania!;
          suggestionDespacho.setDespacho((dataDespacho[0].despacho!).toString());
        });
      } else {
        setState(() {
          destinatarios = []; 
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '¿Cómo quiere realizar su pedido?',
          style: TextStyle(fontFamily: 'MarkProBold', fontSize: 32),
        ),
        const SizedBox(height: 10.0),
        const Text(
          'De acuerdo al tipo de despacho seleccionado se gestionará la programación de su pedido.',
          style: TextStyle(fontFamily: 'MarkProRegular', fontSize: 15),
        ),
        const SizedBox(height: 28.0),
        ToggleButtons(
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < _selectedOptions.length; i++) {
                _selectedOptions[i] = i == index;
              }
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(1000)),
          selectedBorderColor: Colors.black,
          selectedColor: Colors.white,
          fillColor: Colors.black,
          color: Colors.black,
          constraints: const BoxConstraints(
            minHeight: 44.0,
            minWidth: 190.0,
          ),
          isSelected: _selectedOptions,
          children: order,
        ),
        const SizedBox(height: 28.0),
        const Text(
          '¿Desde dónde desea realizar su pedido?',
          style: TextStyle(fontFamily: 'MarkProBold', fontSize: 32),
        ),
        const SizedBox(height: 8.0),
        const Text(
          'Este centro de despacho determinará las existencias y precios de los productos en tienda.',
          style: TextStyle(fontFamily: 'MarkProRegular', fontSize: 15),
        ),
        const SizedBox(height: 12.0),

        if(_selectedOptions[0])
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: destinatarios.map((destinatario) {
            String destinationId =  (destinatario.destinatarioId).toString(); 
            String location = (destinatario.detalle).toString(); 
            String city = (destinatario.ciudad).toString(); 
            String phone = (destinatario.telefonoDestinatario).toString();
            final isSelected = destinationId == selectedDestinatario;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDestinatario = destinationId;
                });
              },
              child: Opacity(
                opacity: isSelected ? 1.0 : 0.5,
                child: Container(
                  width: 300,
                  height: 200,
                  margin: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 0,
                    color: selectedDestinatario == destinationId
                          ? Colors.grey[200]
                          : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: isSelected ? Colors.green : Colors.grey,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(23.0),
                    ),
                    child: RadioListTile<String>(
                      value: (destinatario.destinatarioId ?? '').toString(),
                      groupValue: selectedDestinatario,
                      title: Text(
                        nombreCompania,
                        style: const TextStyle(
                          fontFamily: 'MarkProBold',
                          fontSize: 15,
                        ),
                      ),
                      subtitle: buildInfoColumn(nitCompania, location, city, phone),
                      hoverColor: Colors.green.withOpacity(0.4),
                      fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
                      onChanged: (value) {
                        setState(() {
                          selectedDestinatario = value!;
                        });
                      },
                      isThreeLine: true,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),

        if(_selectedOptions[1])
        BodegaWidget()
        // Text(nombreBodega)
      ],
    );
  }

Widget buildInfoColumn(String nit, String location, String city, String phone) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 6),
      RichText(
        text: TextSpan(
          text: 'Ubicación: ',
          style: const TextStyle(
            fontFamily: 'MarkProBold',
            fontSize: 15,
            fontWeight: FontWeight.bold, // Negrita
            color: Colors.black, // Puedes ajustar el color según tus preferencias
          ),
          children: [
            TextSpan(
              text: location,
              style: const TextStyle(
                fontFamily: 'MarkProRegular',
                fontSize: 15,
                fontWeight: FontWeight.normal, // Puedes ajustar el peso de la fuente según tus preferencias
                color: Colors.black, // Puedes ajustar el color según tus preferencias
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 2),
      RichText(
        text: TextSpan(
          text: 'Ciudad: ',
          style: const TextStyle(
            fontFamily: 'MarkProBold',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: city,
              style: const TextStyle(
                fontFamily: 'MarkProRegular',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 2),
      RichText(
        text: TextSpan(
          text: 'NIT: ',
          style: const TextStyle(
            fontFamily: 'MarkProBold',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: nit,
              style: const TextStyle(
                fontFamily: 'MarkProRegular',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 2),
      RichText(
        text: TextSpan(
          text: 'Teléfono: ',
          style: const TextStyle(
            fontFamily: 'MarkProBold',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: phone,
              style: const TextStyle(
                fontFamily: 'MarkProRegular',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

}
