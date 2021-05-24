class Statistics{
  String real;
  String all;
  String progress;

  Statistics({this.real, this.all, this.progress});

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    real: json['real'],
    all: json['all'],
    progress: json['progress']
  );

  String toString() => "realLessons: $real, allLessons: $all, progress: $progress";
}