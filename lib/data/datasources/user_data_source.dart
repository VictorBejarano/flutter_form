import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_form/data/models/models.dart';

/// Fuente de datos de usuarios
class UserDataSource {
  /// Obtiene el listado de usuarios
  static Future<Map<String, UserModel>> getUserList() async {
    Map<String, UserModel> response = {};
    final String jsonString =
        await rootBundle.loadString('assets/json/user.json');
    await Future.delayed(const Duration(seconds: 1));
    final jsonResponse = json.decode(jsonString);
    for (var item in (jsonResponse as List<dynamic>)) {
      UserModel user = UserModel.fromJson(item);
      response.addEntries([MapEntry(user.id, user)]);
    }
    return response;
  }
}
