import 'package:f_parche/domain/entities/location.dart';
import 'package:f_parche/domain/entities/parche.dart';
import 'package:f_parche/navigation.dart';
import 'package:f_parche/ui/controllers/auth_controller.dart';
import 'package:f_parche/ui/controllers/parche_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loggy/loggy.dart';
import 'package:get/get.dart';

class CrearParchePage extends StatefulWidget {
  const CrearParchePage({Key? key}) : super(key: key);

  @override
  State<CrearParchePage> createState() => _CrearParchePageState();
}

class _CrearParchePageState extends State<CrearParchePage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _locationController = TextEditingController();

  Location? _location;

  final AuthController _authController = Get.find();
  final ParcheController _parcheController = Get.find();

  int _cont = 0;

  @override
  void initState() {
    super.initState();
    _timeController.text = DateFormat('HH:mm').format(DateTime.now());
    _dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crear Parche")),
      body: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: "Nombre del parche",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor ingrese el nombre del parche";
                        }
                        return null;
                      },
                    ),
                    const InputSpacer(),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _dateController,
                            decoration: const InputDecoration(
                              labelText: "Fecha",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                            onTap: () async {
                              final now = DateTime.now();
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: now,
                                firstDate: now,
                                lastDate: DateTime(2101),
                              );

                              if (picked != null) {
                                _dateController.text =
                                    DateFormat('yyyy-MM-dd').format(picked);
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Por favor ingrese la fecha del parche";
                              }
                              return null;
                            },
                            readOnly: true,
                          ),
                        ),
                        const InputSpacer(),
                        Expanded(
                          child: TextFormField(
                            controller: _timeController,
                            decoration: const InputDecoration(
                              labelText: 'Hora',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.access_time),
                            ),
                            onTap: () async {
                              final now = DateTime.now();
                              final TimeOfDay? picked = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(now),
                              );

                              if (picked != null) {
                                _timeController.text = DateFormat('HH:mm')
                                    .format(DateTime(now.year, now.month,
                                        now.day, picked.hour, picked.minute));
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Por favor ingrese la hora del parche";
                              }
                              return null;
                            },
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    const InputSpacer(),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Añade User Id',
                              border: OutlineInputBorder(),
                              hintText: "sdfu7tsdtf6td5sf7t",
                            ),
                            validator: (value) {
                              return null;
                            },
                            enabled: false,
                          ),
                        ),
                        const InputSpacer(),
                        FilledButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(13.0),
                          ),
                          onPressed: null, //TODO: Buscar miembros
                          child: const Icon(Icons.search),
                        ),
                      ],
                    ),
                    const InputSpacer(),
                    Container(
                      height: 200,
                      // color: Colors.amber[600],
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side:
                              const BorderSide(width: 1.5, color: Colors.grey),
                        ),
                        color: Colors.black12,
                      ),
                      child: const Center(
                        child: Text(
                          "Lista de Tripulantes",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const InputSpacer(),
                    TextFormField(
                      controller: _locationController,
                      decoration: const InputDecoration(
                        labelText: 'Ubicación',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.location_on),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor ingrese la ubiccción del parche";
                        }
                        return null;
                      },
                      onTap: _onMapInputTap,
                      readOnly: true,
                      // enabled: false,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: _onSubmitForm, child: const Text("Crear Parche"))
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmitForm() async {
    if (_formKey.currentState!.validate()) {
      logDebug("Crear Parche");

      var currentUser = (_authController.getCurrentUser())!;

      Parche parche = Parche(
        name: _nameController.text,
        description: '',
        creator: currentUser.id,
        meetingDate: '${_dateController.text} ${_timeController.text}',
        location: _location!,
        members: [
          Member(
            key: currentUser.id,
            username: (_authController.getCurrentUser())!.username!,
          )
        ],
      );

      if (await _parcheController.createParche(parche)) {
        logDebug("Parche creado");
        Get.offAllNamed(Routes.home);
      } else {
        logDebug("No se pudo crear el parche");
        logDebug(parche.toJson());
        (() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("No se pudo crear el parche"),
            ),
          );
        })();
      }
    } else {
      logDebug("No se puede crear el parche");
    }
  }

  void _onMapInputTap() async {
    var received = await Get.toNamed(
      Routes.map,
    );

    _location = received as Location?;

    if (_location != null) {
      logDebug(_location.toString());
      if (_location!.address != null && _location!.address!.isNotEmpty) {
        _locationController.text = _location!.address!;
      } else {
        _locationController.text =
            "${_location!.latitude}, ${_location!.longitude}";
      }
    } else {
      logDebug("No se recibió ubicación");
      _locationController.text = "";
    }
  }
}

class InputSpacer extends StatelessWidget {
  const InputSpacer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 10,
        maxHeight: 30,
        minWidth: 5,
        maxWidth: 9,
      ),
    );
  }
}
