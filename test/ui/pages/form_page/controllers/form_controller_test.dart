import 'package:flutter_form/ui/pages/form_page/controllers/form_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FormController formController;

  setUp(() {
    formController = FormController();
  });

  tearDown(() {
    formController.dispose();
  });

  group('FormController Tests', () {
    test('Initial state of controllers', () {
      expect(formController.name, isNotNull);
      expect(formController.secondName, isNotNull);
      expect(formController.bornDate, isNotNull);
      expect(formController.addressControllers, isEmpty);
    });

    test('Add address controller', () {
      formController.addAddressController();
      expect(formController.addressControllers.length, 1);
    });

    test('Remove address controller', () {
      formController.addAddressController();
      formController.addAddressController();
      formController.removeAddressController(0);
      expect(formController.addressControllers.length, 1);
    });
  });
}