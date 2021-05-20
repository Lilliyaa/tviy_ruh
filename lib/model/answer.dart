
import 'dart:convert';


Answer sightModelFromJson(String str) => Answer.fromJson(json.decode(str));

String sightModelToJson(Answer data) => json.encode(data.toJson());


class Answer{
  int id;
  String text;
  bool isSelected = false;
  bool right;

  Answer({
    this.right,
    this.id,
    this.text
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    right: int.parse(json["right"]) == 0? false : true,
    id: int.parse(json["id"]),
    text: json["text"],
  );

  Map<String, dynamic> toJson() =>
      {
        "right": right,
        "id": id,
        "text": text,
      };

}
