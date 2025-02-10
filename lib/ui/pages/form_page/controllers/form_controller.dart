import 'package:flutter/material.dart';
import 'package:flutter_form/ui/pages/form_page/controllers/address_controller.dart';

class FormController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController secondName = TextEditingController();
  final TextEditingController bornDate = TextEditingController();
  final List<AddressController> addressControllers = [];

  void dispose() {
    name.dispose();
    secondName.dispose();
    bornDate.dispose();
    for (var controller in addressControllers) {
      controller.dispose();
    }
  }

  bool validate() => formKey.currentState?.validate() ?? false;

  void addAddressController() {
    addressControllers.add(AddressController());
  }

  void removeAddressController(int index) {
    addressControllers[index].dispose();
    addressControllers.removeAt(index);
  }
}
