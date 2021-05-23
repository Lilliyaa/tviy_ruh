import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class myMap extends StatefulWidget{

  @override
  _myMapState createState() => _myMapState();
}

class _myMapState extends State<myMap> {
  Set<Marker> _markers = {};
  var myMarkers = HashSet<Marker>();
  BitmapDescriptor customMarker;

  getCustomMarker()async{

    customMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/image/marker.png');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomMarker();
  }

/*  void setCustomMarker() async{
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/image/marker.png');
  }*/

  void _onMapCreated(GoogleMapController controller){
setState(() {
  _markers.add(
    Marker(
      markerId: MarkerId('id-1'),
      position: LatLng(50.04559133002625, 36.19669391929029),
      icon: customMarker ,
      infoWindow: InfoWindow(
        title: 'School',
        snippet: 'For real men',

      )
    ),
  );

});

  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(50.04559133002625, 36.19669391929029),
        zoom: 15,
      ),
      ),
    );
  }
}