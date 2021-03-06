class Achieve {
  int achievement_id;
  String name;
  String identifier;
  int requirements;
  String icon;
  String color;
  int progress;

  Achieve({
    this.achievement_id,
    this.name,
    this.identifier,
    this.requirements,
    this.icon,
    this.color,
    this.progress
  });

  factory Achieve.fromJson(Map<String, dynamic> json) => Achieve(
    achievement_id: int.parse(json["achievement_id"]),
    name: json["name"],
    identifier: json["identifier"],
    requirements: int.parse(json["requirements"]),
    icon: json["icon"],
    color: json["color"],
    progress: int.parse(json["progress"]),
  );

  String toString() => "id: $achievement_id, name: $name, progress: $progress";
}