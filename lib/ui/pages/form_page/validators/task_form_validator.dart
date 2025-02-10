abstract class FormValidator {
  String? validate(String? value);
}

class RequiredFieldValidator implements FormValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'El valor es requerido';
    }
    return null;
  }
}