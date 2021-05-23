import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter_apptest/model/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';

class myMap extends StatefulWidget {
  final List<Provider> providers;

  @override
  _myMapState createState() => _myMapState();

  myMap(this.providers);
}

class _myMapState extends State<myMap> {
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  Set<Marker> _markers = {};
  var myMarkers = HashSet<Marker>();
  BitmapDescriptor customSchoolMarker, customInstructorMarker;

  getCustomMarker() async {
    final Uint8List markerIcon1 = await getBytesFromAsset('assets/images/school_marker.png', 100);
    customSchoolMarker =  BitmapDescriptor.fromBytes(markerIcon1);
    final Uint8List markerIcon2 = await getBytesFromAsset('assets/images/instructor_marker.png', 100);
    customInstructorMarker = BitmapDescriptor.fromBytes(markerIcon2);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }


  @override
  void initState() {
    super.initState();
    getCustomMarker();
  }

  void _onMapCreated(GoogleMapController controller) {
    _customInfoWindowController.googleMapController = controller;
    setState(() {
      for (var provider in widget.providers) {
        LatLng temp = provider.getRealCoordinates();
        _markers.add(Marker(
            markerId: MarkerId('id' + provider.coordinates),
            position: temp,
            icon: provider.type == "Школа"? customSchoolMarker : customInstructorMarker,
            onTap: () {
              _customInfoWindowController.addInfoWindow(
                GestureDetector(
                  // TO DO: ЗДЕСЬ ОКТКРЫВАТЬ ПРОФИЛЬ, ЧУВАКА МОЖНО ПРЯМО В НЕГО ПЕРЕДЕВАТЬ ЦЕЛИКОМ provider
                  onTap: (){},
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 128, 128, 128),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network("http://" +
                                        Strings.baseUrl +
                                        "/avatars/" +
                                        (provider.avatar != null
                                            ? provider.avatar
                                            : " ")),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Center(
                                  child: Container(
                                    width: 120,
                                    child:  Text(
                                        provider.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            shadows: [],
                                            color: Colors.white,
                                            fontSize: 16
                                        )
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ),
                      Triangle.isosceles(
                        edge: Edge.BOTTOM,
                        child: Container(
                          color:Color.fromARGB(255, 128, 128, 128),
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                temp,
              );
            }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          onTap: (position) {
            _customInfoWindowController.hideInfoWindow();
          },
          onCameraMove: (position) {
            _customInfoWindowController.onCameraMove();
          },
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: LatLng(50.04559133002625, 36.19669391929029),
            zoom: 10,
          ),
        ),
        CustomInfoWindow(
          controller: _customInfoWindowController,
          height: 160,
          width: 150,
          offset: 40,
        ),
      ],
    ));
  }
}
