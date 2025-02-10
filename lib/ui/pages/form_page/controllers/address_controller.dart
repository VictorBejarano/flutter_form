import 'package:flutter/material.dart';
import 'package:flutter_form/models/models.dart';

class AddressController {
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipController = TextEditingController();

  void dispose() {
    streetController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
  }

  Address toAddress() {
    return Address(
      street: streetController.text,
      city: cityController.text,
      state: stateController.text,
      zipCode: zipController.text,
    );
  }

  void fromAddress(Address address) {
    streetController.text = address.street;
    cityController.text = address.city;
    stateController.text = address.state;
    zipController.text = address.zipCode;
  }
}
