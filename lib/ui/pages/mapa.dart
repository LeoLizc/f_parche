import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:f_parche/domain/entities/location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loggy/loggy.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

Future<LatLng> actualLocation() async {
  var serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return const LatLng(10.933721912132299, -74.77986178452828);
  }

  var permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return const LatLng(10.933721912132299, -74.77986178452828);
    }
  }

  final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return LatLng(position.latitude, position.longitude);
}

class _MapaPageState extends State<MapaPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final _detailsController = TextEditingController();

  Marker _marker = const Marker(
    markerId: MarkerId('parche'),
    position: LatLng(10.933721912132299, -74.77986178452828),
    infoWindow: InfoWindow(title: 'Parche'),
    icon: BitmapDescriptor.defaultMarker,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        backgroundColor: const Color(0xFFFC6411),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(25),
              child: TextField(
                controller: _detailsController,
                decoration: const InputDecoration(
                    labelText: "Detalles", border: OutlineInputBorder()),
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
                child: FutureBuilder(
                  future: actualLocation(),
                  builder: (_, snapshot) => !snapshot.hasData
                      ? CircularProgressIndicator()
                      : GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                            target: snapshot.hasData
                                ? snapshot.data as LatLng
                                : const LatLng(
                                    10.933721912132299, -74.77986178452828),
                            zoom: 15,
                          ),
                          // compassEnabled: true,
                          myLocationEnabled: true,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                          markers: <Marker>{
                            _marker,
                          },
                          onTap: (argument) {
                            logDebug(argument.toString());

                            setState(() {
                              _marker = _marker.copyWith(
                                positionParam: argument,
                              );
                            });
                          },
                        ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back(
                  result: Location(
                latitude: _marker.position.latitude.toString(),
                longitude: _marker.position.longitude.toString(),
                address: _detailsController.text,
              ));
            },
            //cambiar color
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
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
