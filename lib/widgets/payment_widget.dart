import 'package:flutter/material.dart';

const List<Widget> paymentType = <Widget>[
  Text('Crédito'),
  Text('Contado'),
];

const List<String> creditOptions = ['1 día', '30 días', '45 días', '60 días', '90 días', '120 días'];

class PaymentTypeWidget extends StatefulWidget {
  const PaymentTypeWidget({super.key});

  @override
  State<PaymentTypeWidget> createState() => _ToggleButtonsSampleState();
}

class _ToggleButtonsSampleState extends State<PaymentTypeWidget> {
  final List<bool> _selectedOptions = <bool>[true, false];
  String _selectedCreditOption = '1 día';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Container(
          width: 2000,
          child: ToggleButtons(
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _selectedOptions.length; i++) {
                  _selectedOptions[i] = i == index;
                }
                _selectedCreditOption = '1 día'; 
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
            children: paymentType,
          ),
        ),
        const SizedBox(height: 16),
        if (_selectedOptions[0])
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              const Text(
                'Seleccione el tipo de crédito',
                style: TextStyle(fontFamily: 'MarkProBold', fontSize: 14),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: creditOptions
                    .map(
                      (option) => Row(
                        children: [
                          Radio<String>(
                            value: option,
                            groupValue: _selectedCreditOption,
                            hoverColor: Colors.green.withOpacity(0.4), // Establece el color cuando el ratón pasa sobre el radio
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
                            onChanged: (value) {
                              setState(() {
                                _selectedCreditOption = value!;
                              });
                            },
                          ),
                          Text(option),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          )
      ],
    );
  }
}
