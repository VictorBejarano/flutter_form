import 'package:flutter_form/ui/pages/form_page/validators/task_form_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Form Validators', () {
    late RequiredFieldValidator requiredValidator;

    setUp(() {
      requiredValidator = RequiredFieldValidator();
    });

    test('RequiredFieldValidator returns error for null value', () {
      expect(requiredValidator.validate(null), 'El valor es requerido');
    });

    test('RequiredFieldValidator returns error for empty string', () {
      expect(requiredValidator.validate(''), 'El valor es requerido');
    });

    test('RequiredFieldValidator returns null for non-empty value', () {
      expect(requiredValidator.validate('some value'), isNull);
    });
  });
}
