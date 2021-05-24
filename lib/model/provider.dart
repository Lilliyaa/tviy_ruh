import 'dart:convert';

import 'package:flutter_apptest/constants/strings.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Provider {
  String type;
  int id;
  String name;
  String category;
  String price;
  String address;
  String avatar;
  String coordinates;
  String contact;

  Provider(
      {this.type,
      this.id,
      this.name,
      this.category,
      this.price,
      this.address,
      this.avatar,
      this.coordinates,
      this.contact});

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        type: json["type"],
        id: int.parse(json["id"]),
        name: json["name"],
        category: json["category"],
        price: json["price"],
        address: json["address"],
        avatar: json["avatar"],
        coordinates: json["coordinates"],
      contact: json["contact"]
      );
  LatLng getRealCoordinates(){
    String latitude = coordinates.substring(0, coordinates.indexOf(','));
    String longitude = coordinates.substring(coordinates.indexOf(',')+2, coordinates.length);
    LatLng res = LatLng(double.parse(latitude), double.parse(longitude));
    return res;
  }
  String toString() =>
      "type: $type, id: $id, name: $name, category: $category, price: $price, address: $address, avatar: $avatar, contact: $contact";
}
