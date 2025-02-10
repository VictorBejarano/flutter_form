import 'package:flutter_form/ui/pages/form_page/controllers/address_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form/models/models.dart';

void main() {
  group('AddressController', () {
    late AddressController controller;

    setUp(() {
      controller = AddressController();
    });

    tearDown(() {
      controller.dispose();
    });

    test('toAddress converts controllers to Address', () {
      // Arrange
      controller.streetController.text = '123 Test St';
      controller.cityController.text = 'Testville';
      controller.stateController.text = 'TS';
      controller.zipController.text = '12345';

      // Act
      final address = controller.toAddress();

      // Assert
      expect(address.street, '123 Test St');
      expect(address.city, 'Testville');
      expect(address.state, 'TS');
      expect(address.zipCode, '12345');
    });

    test('fromAddress populates controllers', () {
      // Arrange
      final testAddress = Address(
        street: '456 Main St',
        city: 'Anytown',
        state: 'ST',
        zipCode: '67890',
      );

      // Act
      controller.fromAddress(testAddress);

      // Assert
      expect(controller.streetController.text, '456 Main St');
      expect(controller.cityController.text, 'Anytown');
      expect(controller.stateController.text, 'ST');
      expect(controller.zipController.text, '67890');
    });
  });
}
