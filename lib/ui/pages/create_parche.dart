import 'package:flutter/material.dart';

class CreateParchePage extends StatefulWidget {
  const CreateParchePage({Key? key}) : super(key: key);

  @override
  _CreateParchePageState createState() => _CreateParchePageState();
}

class _CreateParchePageState extends State<CreateParchePage> {
  TextEditingController fechaController = TextEditingController();
  TextEditingController horaController = TextEditingController();
  TextEditingController amigosController = TextEditingController();
  TextEditingController lAmigosController = TextEditingController();
  TextEditingController directionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            );
          },
        ),
        title: const Text('Nuevo parche'),
        backgroundColor: const Color(0xFFFC6411),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFieldWithLabel(
                    controller: fechaController,
                    label: 'Fecha',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFieldWithLabel(
                    controller: directionController,
                    label: 'Hora',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFieldWithLabel(
              controller: amigosController,
              label: 'Lista de amigos',
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFieldWithLabel(
                    controller: directionController,
                    label: 'Direction',
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEAA68),
                  ),
                  child: const Text('Buscar'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFieldWithLabel(
              controller: lAmigosController,
              label: 'Amigos del plan',
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFEAA68),
              ),
              child: const Text('Crear'),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWithLabel extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLines;

  const TextFieldWithLabel({
    super.key,
    required this.controller,
    required this.label,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
