import 'package:flutter/material.dart';
import 'package:flutter_form/ui/pages/list_page/list_page.dart';
import 'package:flutter_form/ui/routes.dart';

/// Clase app principal
class App extends StatelessWidget {
  const App({super.key});

  /// Metodo para construir el widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: ListFormPage.route,
      routes: routes,
    );
  }
}
