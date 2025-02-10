import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form/data/models/user_model.dart';
import 'package:flutter_form/models/mode_form.dart';
import 'package:flutter_form/ui/bloc/user/user_bloc.dart';
import 'package:flutter_form/ui/pages/form_page/widgets/address_form_field.dart';
import 'package:flutter_form/ui/pages/form_page/controllers/address_controller.dart';
import 'package:flutter_form/ui/pages/form_page/controllers/form_controller.dart';
import 'package:flutter_form/ui/pages/form_page/widgets/form_widgets.dart';
import 'package:flutter_form/ui/pages/widgets/widgets.dart';
import 'package:intl/intl.dart';

// 5. form_page.dart - La página principal refactorizada
class FormPage extends StatefulWidget {
  static const String route = 'form';

  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final FormController _controller = FormController();

  ModeForm? _mode;
  late String _id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeFormData();
  }

  void _initializeFormData() {
    if (_mode != null) return;

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _mode = args['mode'];

    if (_mode == ModeForm.view) {
      _loadTaskData(args['id']);
    }
    _controller.addAddressController();
  }

  void _loadTaskData(String id) {
    _id = id;
    final user = context.read<UserBloc>().state.dictionary[id]!;

    _controller.name.text = user.name;
    _controller.secondName.text = user.secondName;
    _controller.bornDate.text = user.bornDate;

    // Cargar direcciones existentes
    _controller.addressControllers.clear();
    for (var address in user.addresses) {
      final addressController = AddressController();
      addressController.fromAddress(address);
      _controller.addressControllers.add(addressController);
    }
    if (_controller.addressControllers.isEmpty) {
      _controller.addAddressController();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _controller.bornDate.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  void _handleCreate() {
    if (!_controller.validate()) return;

    final addresses = _controller.addressControllers
        .map((controller) => controller.toAddress())
        .toList();

    context.read<UserBloc>().createUser(
          UserModel(
            id: '',
            name: _controller.name.text,
            secondName: _controller.secondName.text,
            bornDate: _controller.bornDate.text,
            addresses: addresses, // Agregar las direcciones
          ),
        );

    Navigator.pop(context);
  }

  void _handleEdit() {
    if (!_controller.validate()) return;

    final addresses = _controller.addressControllers
        .map((controller) => controller.toAddress())
        .toList();

    context.read<UserBloc>().editUser(
          UserModel(
            id: _id,
            name: _controller.name.text,
            secondName: _controller.secondName.text,
            bornDate: _controller.bornDate.text,
            addresses: addresses, // Agregar las direcciones
          ),
        );

    Navigator.pop(context);
  }

  void _handleDelete() {
    context.read<UserBloc>().deleteUser(_id);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarForm(
        title: _getPageTitle(),
      ),
      floatingActionButton: _buildFloatingActionButton(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Form(
          key: _controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TaskFormFields(
                  controller: _controller,
                  mode: _mode!,
                  onDateTap: _selectDate,
                ),
                const SizedBox(height: 20),
                Text(
                  'Direcciones',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                // Lista de direcciones
                ...List.generate(
                  _controller.addressControllers.length,
                  (index) {
                    final addressController =
                        _controller.addressControllers[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: AddressFormField(
                        streetController: addressController.streetController,
                        cityController: addressController.cityController,
                        stateController: addressController.stateController,
                        zipController: addressController.zipController,
                        onDelete: () {
                          setState(() {
                            _controller.removeAddressController(index);
                          });
                        },
                        showDeleteButton:
                            _controller.addressControllers.length > 1,
                        enabled: _mode != ModeForm.view,
                      ),
                    );
                  },
                ),
                // Botón para agregar dirección
                if (_mode != ModeForm.view)
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _controller.addAddressController();
                      });
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Agregar Dirección'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                const SizedBox(height: 16),
                _buildActionButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getPageTitle() {
    switch (_mode) {
      case ModeForm.create:
        return 'Crear Usuario';
      case ModeForm.edit:
        return 'Editar Usuario';
      case ModeForm.view:
        return 'Ver Usuario';
      default:
        return 'ERROR';
    }
  }

  Widget? _buildFloatingActionButton() {
    if (_mode != ModeForm.view) return null;

    return FloatingActionButton(
      onPressed: () => setState(() => _mode = ModeForm.edit),
      child: const Icon(Icons.edit),
    );
  }

  Widget _buildActionButton() {
    switch (_mode) {
      case ModeForm.create:
        return ElevatedButton(
          onPressed: _handleCreate,
          child: const Text('CREAR USUARIO'),
        );
      case ModeForm.edit:
        return ElevatedButton(
          onPressed: _handleEdit,
          child: const Text('EDITAR USUARIO'),
        );
      case ModeForm.view:
        return ElevatedButton(
          onPressed: _handleDelete,
          child: const Text('ELIMINAR'),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
