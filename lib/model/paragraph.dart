
import 'dart:convert';

Paragraph sightModelFromJson(String str) => Paragraph.fromJson(json.decode(str));

String sightModelToJson(Paragraph data) => json.encode(data.toJson());


class Paragraph {
  int id;
  String name;
  String video;

  Paragraph({
    this.id,
    this.name,
    this.video
  });

  factory Paragraph.fromJson(Map<String, dynamic> json) => Paragraph(
      id: int.parse(json["id"]),
      name: json["name"],
      video: json["video"]
  );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "video": video
      };

}
