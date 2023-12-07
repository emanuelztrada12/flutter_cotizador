import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cotizador/screens/screens.dart';
import 'package:cotizador/providers/providers.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CompaniaProviders(), lazy: false),
      ChangeNotifierProvider(create: (_) => SelectedSuggestionProvider(), lazy: false),
      ChangeNotifierProvider(create: (_) => LoadingProvider(), lazy: false),
      ChangeNotifierProvider(create: (_) => DespachoProviders(), lazy: false)
    ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: CotizacionScreen(),
    );
  }
}
