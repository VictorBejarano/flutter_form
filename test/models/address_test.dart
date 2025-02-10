import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form/models/models.dart';

void main() {
  group('Address', () {
    final testAddress = Address(
      street: '123 Main St',
      city: 'Testville',
      state: 'TS',
      zipCode: '12345',
    );

    test('fromJson creates Address correctly', () {
      final json = {
        'street': '123 Main St',
        'city': 'Testville',
        'state': 'TS',
        'zip_code': '12345'
      };

      final address = Address.fromJson(json);

      expect(address.street, '123 Main St');
      expect(address.city, 'Testville');
      expect(address.state, 'TS');
      expect(address.zipCode, '12345');
    });

    test('toJson converts Address to correct JSON', () {
      final json = testAddress.toJson();

      expect(json['street'], '123 Main St');
      expect(json['city'], 'Testville');
      expect(json['state'], 'TS');
      expect(json['zipCode'], '12345');
    });

    test('Address instances with different properties are distinct', () {
      final address1 = Address(
        street: '123 Main St',
        city: 'Testville',
        state: 'TS',
        zipCode: '12345',
      );

      final address2 = Address(
        street: '456 Elm St',
        city: 'Othertown',
        state: 'OS',
        zipCode: '67890',
      );

      expect(address1, isNot(equals(address2)));
    });
  });
}