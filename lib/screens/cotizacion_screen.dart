import 'package:flutter/material.dart';
import 'package:cotizador/widgets/widgets.dart';

class CotizacionScreen extends StatelessWidget {
  const CotizacionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text(''),
      ),
      body: Container(
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cree su cotización',
                  style: TextStyle(fontFamily: 'MarkProBold', fontSize: 32),
                ),
                Text(
                  'Ingrese los datos para realizar su cotización para el cliente.',
                  style: TextStyle(fontFamily: 'MarkProRegular', fontSize: 15),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Nombre de su cliente',
                  style: TextStyle(fontFamily: 'MarkProBold', fontSize: 15),
                ),
                SizedBox(height: 8.0),
                SearchWidget(),
                SizedBox(height: 16.0),
                CompaniaDataWidget(),
                SizedBox(height: 16.0),
                TableWidget(),
                SizedBox(height: 16.0),
                Text(
                  'Selecciona el tipo de pago',
                  style: TextStyle(fontFamily: 'MarkProBold', fontSize: 15),
                ),
                PaymentTypeWidget(),
                SizedBox(height: 16.0),
                Divider(),
                SizedBox(height: 16.0),
                DestinationWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
