part of 'widgets.dart';

///  Widget tarjeta de la tarea.
///   Parámetros:
///   * [name] El nombre del empleado.
///   * [secondName] El titulo de la tarea.
///   * [bornDate] Fecha de entrega.
///   * [opTap] evento tap.
class CardUser extends StatelessWidget {
  final String name;
  final String secondName;
  final String bornDate;
  final Function() onTap;

  /// Constructor del widget CardToDo
  /// [name], [secondName], [bornDate], [state] y [opTap] son requeridos.
  const CardUser(
      {super.key,
      required this.name,
      required this.secondName,
      required this.bornDate,
      required this.onTap});

  /// Metodo para construir el widget
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: _dataText(),
        ),
      ),
    );
  }

  /// Metodo para mostrar la informacion basica de la tarjeta
  Widget _dataText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(name),
          ],
        ),
        Text(
          secondName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        _dateText()
      ],
    );
  }

  /// Metodo para mostrar y formatear la fecha de entrega
  Widget _dateText() {
    return RichText(
        text: TextSpan(
      text: 'Fecha de nacimiento: ',
      style:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade900),
      children: <TextSpan>[
        TextSpan(
            text: bornDate,
            style: const TextStyle(fontWeight: FontWeight.normal)),
      ],
    ));
  }
}
