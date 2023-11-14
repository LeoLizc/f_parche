import 'package:flutter/material.dart';

class CreateParchePage extends StatefulWidget {
  @override
  _CreateParchePageState createState() => _CreateParchePageState();
}

class _CreateParchePageState extends State<CreateParchePage> {
  TextEditingController fechaController = TextEditingController();
  TextEditingController horaController = TextEditingController();
  TextEditingController amigosController = TextEditingController();
  TextEditingController LamigosController = TextEditingController();
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
        title: Text('Nuevo parche'),
        backgroundColor: Color(0xFFFC6411),
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
                SizedBox(width: 16),
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
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Buscar'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFEAA68),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFieldWithLabel(
              controller: LamigosController,
              label: 'Amigos del plan',
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Crear'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFEAA68),
              ),
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

  TextFieldWithLabel({
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
        SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
