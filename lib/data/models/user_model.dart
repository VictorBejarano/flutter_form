import 'dart:convert';

import 'package:flutter_form/domain/domain.dart';
import 'package:flutter_form/models/models.dart';

/// Crea instancia de UserModel a partir de json
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

/// Modelo del usuario
class UserModel extends User {
  /// Crea una instancia de UserModel
  const UserModel({
    required super.id,
    required super.name,
    required super.secondName,
    required super.bornDate,
    required super.addresses,
  });

  /// Crea [UserModel] a partir de json
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        secondName: json["second_name"],
        bornDate: json["born_date"],
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromJson(x))),
      );

  /// Crea json a partir de [UserModel]
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "second_name": secondName,
        "born_date": bornDate,
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
      };

  /// Copia el [UserModel]
  UserModel copyWith({
    String? id,
    String? name,
    String? secondName,
    String? bornDate,
    List<Address>? addresses,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        secondName: secondName ?? this.secondName,
        bornDate: bornDate ?? this.bornDate,
        addresses: addresses ?? this.addresses,
      );
}
