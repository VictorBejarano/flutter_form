import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form/data/models/user_model.dart';
import 'package:flutter_form/models/mode_form.dart';
import 'package:flutter_form/ui/bloc/user/user_bloc.dart';
import 'package:flutter_form/ui/pages/form_page/form_page.dart';
import 'package:flutter_form/ui/pages/list_page/widgets/widgets.dart';
import 'package:flutter_form/ui/pages/widgets/widgets.dart';

///  Pagina de Listado de tareas - [route] path de ruta.
class ListUserPage extends StatefulWidget {
  const ListUserPage({super.key});

  static String route = 'list-user';

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

/// Clase estado de ListTodoPage
class _ListUserPageState extends State<ListUserPage> {
  /// Se ejecuta cuando el widget se inicia
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).getUsers();
  }

  /// Metodo para construir el widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarForm(
        title: 'Lista de usuarios',
      ),
      body: _listTasks(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, FormPage.route,
              arguments: <String, dynamic>{'mode': ModeForm.create});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  /// Crea el componente con indicador de actualizacion y bloc
  Widget _listTasks() {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return _switchState(state);
        },
      ),
    );
  }

  /// Condiciones para visualizar mensajes y listado de tareas
  Widget _switchState(UserState state) {
    switch (state) {
      case GetUserInProgress():
        return _textMessageContainer(
            message: '...Cargando', color: Colors.indigo);
      case GetUserSuccess():
        List<UserModel> list = state.dictionary.values.toList();
        if (list.isNotEmpty) {
          return _createListBuilder(list);
        }
        return _textMessageContainer(
            message: 'No hay tareas',
            color: Colors.indigo,
            child: IconButton(
                onPressed: _refreshData,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.indigo,
                )));
      case GetUserError():
        return _textMessageContainer(
            message: state.messageError, color: Colors.red);
      default:
        return const Text('Error en cambio de estado');
    }
  }

  /// Crea el ListView.builder
  Widget _createListBuilder(List<UserModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final user = list[index];
        return _createCardTodo(user);
      },
    );
  }

  /// Crea el estandar para las tarjetas de las tareas
  Widget _createCardTodo(UserModel task) {
    return CardUser(
      name: task.name,
      secondName: task.secondName,
      bornDate: task.bornDate,
      onTap: () {
        Navigator.pushNamed(context, FormPage.route,
            arguments: <String, dynamic>{'mode': ModeForm.view, 'id': task.id});
      },
    );
  }

  /// Contenedor de mensajes a visualizar
  Widget _textMessageContainer(
      {required String message, required Color color, Widget? child}) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(
                  color: color, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            (child != null) ? child : const SizedBox.shrink()
          ],
        )));
  }

  /// Actualiza los datos a partir del estado en bloc
  Future<void> _refreshData() async {
    setState(() {
      BlocProvider.of<UserBloc>(context).getUsers();
    });
  }
}
