import 'package:flutter/material.dart';
import 'package:flutter_form/ui/pages/form_page/form_page.dart';
import 'package:flutter_form/ui/pages/list_page/list_user_page.dart';

/// Rutas de la aplicacion
Map<String, Widget Function(BuildContext)> routes = {
  ListUserPage.route: (_) => const ListUserPage(),
  FormPage.route: (_) => const FormPage(),
};
