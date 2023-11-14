import 'package:flutter/material.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Agregar la navegación hacia atrás o cualquier otra acción necesaria.
              },
            );
          },
        ),
        title: Text('Mapa'),
        backgroundColor: Color(0xFFFC6411),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              margin: const EdgeInsets.all(25),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Ingrese texto',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(25),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(15, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.width * 0.90,
                width: MediaQuery.of(context).size.width * 0.90,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            //cambiar color
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFFEAA68),
              onPrimary: Colors.white,
              onSurface: Colors.grey,
            ),
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}
