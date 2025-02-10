import 'package:flutter_form/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form/models/models.dart';

void main() {
  group('User Entity', () {
    final testAddresses = [
      Address(
        street: '123 Test St',
        city: 'Testville', 
        state: 'TS',
        zipCode: '12345',
      )
    ];

    test('User instances with same properties are equal', () {
      final user1 = User(
        id: '1',
        name: 'John',
        secondName: 'Doe',
        bornDate: '1990-01-01',
        addresses: testAddresses,
      );

      final user2 = User(
        id: '1',
        name: 'John',
        secondName: 'Doe',
        bornDate: '1990-01-01',
        addresses: testAddresses,
      );

      expect(user1, equals(user2));
    });

    test('User instances with different properties are not equal', () {
      final user1 = User(
        id: '1',
        name: 'John',
        secondName: 'Doe',
        bornDate: '1990-01-01',
        addresses: testAddresses,
      );

      final user2 = User(
        id: '2',
        name: 'Jane',
        secondName: 'Smith',
        bornDate: '1995-05-05',
        addresses: [],
      );

      expect(user1, isNot(equals(user2)));
    });

    test('props method returns correct list of properties', () {
      final user = User(
        id: '1',
        name: 'John',
        secondName: 'Doe',
        bornDate: '1990-01-01',
        addresses: testAddresses,
      );

      expect(user.props, [
        '1', 
        'John', 
        'Doe', 
        '1990-01-01', 
        testAddresses
      ]);
    });
  });
}