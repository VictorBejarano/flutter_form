import 'package:flutter/material.dart';
import 'package:flutter_form/models/mode_form.dart';
import 'package:flutter_form/ui/pages/form_page/form_page.dart';
import 'package:flutter_form/ui/pages/widgets/widgets.dart';

///  Pagina de Listado de tareas - [route] path de ruta.
class ListFormPage extends StatefulWidget {
  const ListFormPage({super.key});

  static String route = 'list-form';

  @override
  State<ListFormPage> createState() => _ListFormPageState();
}

/// Clase estado de ListFormPage
class _ListFormPageState extends State<ListFormPage> {
  /// Se ejecuta cuando el widget se inicia
  @override
  void initState() {
    super.initState();
  }

  /// Metodo para construir el widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarForm(
        title: 'Lista de usuarios',
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, FormPage.route,
              arguments: <String, ModeForm>{'mode': ModeForm.create});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
