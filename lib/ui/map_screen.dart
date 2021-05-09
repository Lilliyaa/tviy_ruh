import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class myMap extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: GoogleMap(initialCameraPosition: CameraPosition(
          target: LatLng(50.04559133002625, 36.19669391929029),
        zoom: 15,
      ),
      ),
    );
  }
}