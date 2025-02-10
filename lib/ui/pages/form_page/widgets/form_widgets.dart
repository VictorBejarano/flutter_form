import 'package:flutter/material.dart';
import 'package:flutter_form/models/mode_form.dart';
import 'package:flutter_form/ui/pages/form_page/controllers/form_controller.dart';
import 'package:flutter_form/ui/pages/form_page/validators/task_form_validator.dart';

// 4. form_widgets.dart - Separando los widgets del formulario
class TaskFormFields extends StatelessWidget {
  final FormController controller;
  final ModeForm mode;
  final VoidCallback onDateTap;

  const TaskFormFields({
    super.key,
    required this.controller,
    required this.mode,
    required this.onDateTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField(
          controller: controller.name,
          label: 'Nombre',
          enabled: mode != ModeForm.view,
          validator: RequiredFieldValidator().validate,
          textCapitalization: TextCapitalization.sentences,
        ),
        const SizedBox(height: 10),
        _buildTextField(
          controller: controller.secondName,
          label: 'Apellido',
          enabled: mode != ModeForm.view,
          validator: RequiredFieldValidator().validate,
          textCapitalization: TextCapitalization.sentences,
        ),
        const SizedBox(height: 10),
        _buildDateField(
          controller: controller.bornDate,
          enabled: mode != ModeForm.view,
          onTap: onDateTap,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool enabled = true,
    String? Function(String?)? validator,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(labelText: label),
      validator: validator,
      textCapitalization: textCapitalization,
    );
  }

  Widget _buildDateField({
    required TextEditingController controller,
    required VoidCallback onTap,
    bool enabled = true,
  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      decoration: const InputDecoration(labelText: 'Fecha de nacimiento'),
      readOnly: true,
      onTap: onTap,
      validator: RequiredFieldValidator().validate,
    );
  }
}
