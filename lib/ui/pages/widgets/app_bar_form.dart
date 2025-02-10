part of 'widgets.dart';

///  Widget global de la barra de navegacion personalizada.
///   Parámetros:
///   * [title] Titulo a mostrar.
class AppBarForm extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  /// Constructor del widget AppBarForm
  /// [title] es requerido,
  const AppBarForm({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  /// Metodo para construir el widget
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple,
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      scrolledUnderElevation: 2,
      shadowColor: Theme.of(context).colorScheme.shadow,
    );
  }
}
