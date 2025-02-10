import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form/ui/bloc/user/user_bloc.dart';
import 'package:flutter_form/ui/pages/home_page/home_page.dart';
import 'package:flutter_form/ui/routes.dart';

/// Clase app principal
class App extends StatelessWidget {
  const App({super.key});

  /// Metodo para construir el widget
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Form',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        initialRoute: HomePage.route,
        routes: routes,
      ),
    );
  }
}
