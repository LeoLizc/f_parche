import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        backgroundColor: const Color(0xFFFC6411),
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
                // color: Colors.black,
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(10.933721912132299, -74.77986178452828),
                    zoom: 15,
                  ),
                  compassEnabled: true,
                  myLocationEnabled: true,
                  onMapCreated: (_) {},
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            //cambiar color
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFEAA68),
              foregroundColor: Colors.white,
              disabledForegroundColor: Colors.grey,
            ),
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}
