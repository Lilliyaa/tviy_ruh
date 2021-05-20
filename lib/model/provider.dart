import 'dart:convert';

import 'package:flutter_apptest/constants/strings.dart';

class Provider {
  String type;
  int id;
  String name;
  String category;
  String price;
  String address;
  String avatar;

  Provider(
      {this.type,
      this.id,
      this.name,
      this.category,
      this.price,
      this.address,
      this.avatar});

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        type: json["type"],
        id: int.parse(json["id"]),
        name: json["name"],
        category: json["category"],
        price: json["price"],
        address: json["address"],
        avatar: json["avatar"],
      );

  String toString() =>
      "type: $type, id: $id, name: $name, category: $category, price: $price, address: $address, avatar: $avatar";
}
