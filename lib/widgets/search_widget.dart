import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'package:cotizador/providers/providers.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});
  @override
  createState() => _CustomTypeAheadFieldState();
}

class _CustomTypeAheadFieldState extends State<SearchWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final companiaProvider = Provider.of<CompaniaProviders>(context, listen: false);
    final selectedSuggestionProvider = Provider.of<SelectedSuggestionProvider>(context, listen: false);

    return Container(
      width: 600,
      child: TypeAheadField<SearchDataCompania>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            labelText: 'Ingrese nombre o código de cliente',
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(1000.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(1000.0),
            ),
            labelStyle: TextStyle(
              color: _focusNode.hasFocus ? Colors.green : Colors.grey,
            ),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _controller.clear();
                        selectedSuggestionProvider.setSelectedSuggestion('');
                      });
                    },
                  )
                : null,
          ),
        ),
        suggestionsCallback: (pattern) async {
          try {
            final sugerencias = await companiaProvider.getSearchData(pattern);
            return sugerencias;
          } catch (error) {
            print('Error en suggestionsCallback: $error');
            return [];
          }
        },
        itemBuilder: (context, SearchDataCompania suggestion) {
          return ListTile(
            title: Text(
                '${suggestion.nombreCompania} - ${suggestion.companiaSap}'),
          );
        },
        onSuggestionSelected: (SearchDataCompania suggestion) {
            _controller.text = '${suggestion.nombreCompania}';
            selectedSuggestionProvider.setSelectedSuggestion((suggestion.companiaSap).toString());
            Future.delayed(const Duration(milliseconds: 200));
        },
        noItemsFoundBuilder: (context) {
          return const SizedBox();
        },
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
          color: Colors.white,
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4)),
      ),
    );
  }
}
