import 'package:equatable/equatable.dart';
import 'package:flutter_form/models/models.dart';

/// Endidad de usuario
///   Parámetros:
///   * [id] Id del usuario
///   * [name] Nombre
///   * [secondName] Apellido
///   * [bornDate] fecha de nacimiento
///   * [addresses] Direcciones
class User extends Equatable {
  final String id;
  final String name;
  final String secondName;
  final String bornDate;
  final List<Address> addresses;

  /// Crea una instancia de User
  const User({
    required this.id,
    required this.name,
    required this.secondName,
    required this.bornDate,
    required this.addresses,
  });

  /// Props de Equatable
  @override
  List<Object> get props => [id, name, secondName, bornDate, addresses];
}
