import 'dart:convert';
import 'package:flutter_form/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form/models/models.dart';

void main() {
  group('UserModel', () {
    final testAddresses = [
      Address(
        street: '123 Test St',
        city: 'Testville',
        state: 'TS',
        zipCode: '12345',
      )
    ];

    final testUser = UserModel(
      id: '1',
      name: 'John',
      secondName: 'Doe',
      bornDate: '1990-01-01',
      addresses: testAddresses,
    );

    test('fromJson creates UserModel correctly', () {
      final json = {
        "id": "1",
        "name": "John",
        "second_name": "Doe",
        "born_date": "1990-01-01",
        "addresses": [
          {
            "street": "123 Test St",
            "city": "Testville",
            "state": "TS",
            "zip_code": "12345"
          }
        ]
      };

      final userModel = UserModel.fromJson(json);

      expect(userModel.id, '1');
      expect(userModel.name, 'John');
      expect(userModel.secondName, 'Doe');
      expect(userModel.bornDate, '1990-01-01');
      expect(userModel.addresses.length, 1);
      expect(userModel.addresses[0].street, '123 Test St');
    });

    test('toJson converts UserModel to correct JSON', () {
      final json = testUser.toJson();

      expect(json['id'], '1');
      expect(json['name'], 'John');
      expect(json['second_name'], 'Doe');
      expect(json['born_date'], '1990-01-01');
      expect(json['addresses'].length, 1);
      expect(json['addresses'][0]['street'], '123 Test St');
    });

    test('copyWith creates a new UserModel with updated fields', () {
      final updatedUser = testUser.copyWith(
        name: 'Jane',
        bornDate: '1995-05-05'
      );

      expect(updatedUser.id, testUser.id);
      expect(updatedUser.name, 'Jane');
      expect(updatedUser.secondName, testUser.secondName);
      expect(updatedUser.bornDate, '1995-05-05');
      expect(updatedUser.addresses, testUser.addresses);
    });

    test('userModelFromJson deserializes JSON string correctly', () {
      final jsonString = json.encode({
        "id": "1",
        "name": "John",
        "second_name": "Doe",
        "born_date": "1990-01-01",
        "addresses": [
          {
            "street": "123 Test St",
            "city": "Testville",
            "state": "TS",
            "zip_code": "12345"
          }
        ]
      });

      final userModel = userModelFromJson(jsonString);

      expect(userModel.id, '1');
      expect(userModel.name, 'John');
    });
  });
}