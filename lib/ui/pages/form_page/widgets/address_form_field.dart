import 'package:flutter/material.dart';

class AddressFormField extends StatelessWidget {
  final TextEditingController streetController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController zipController;
  final VoidCallback onDelete;
  final bool showDeleteButton;
  final bool enabled;

  const AddressFormField({
    super.key,
    required this.streetController,
    required this.cityController,
    required this.stateController,
    required this.zipController,
    required this.onDelete,
    this.showDeleteButton = true,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Dirección',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (showDeleteButton)
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: enabled ? onDelete : null,
                  ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: streetController,
              enabled: enabled,
              decoration: const InputDecoration(
                labelText: 'Calle y número',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La calle es requerida';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: cityController,
                    enabled: enabled,
                    decoration: const InputDecoration(
                      labelText: 'Ciudad',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'La ciudad es requerida';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: stateController,
                    enabled: enabled,
                    decoration: const InputDecoration(
                      labelText: 'Estado',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El estado es requerido';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: zipController,
              enabled: enabled,
              decoration: const InputDecoration(
                labelText: 'Código Postal',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El código postal es requerido';
                }
                if (!RegExp(r'^\d{5}$').hasMatch(value)) {
                  return 'Ingrese un código postal válido';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
