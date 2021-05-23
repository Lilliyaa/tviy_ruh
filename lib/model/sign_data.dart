

class SignData{
  String image;
  String text;

  SignData({this.image, this.text});

  factory SignData.fromJson(Map<String, dynamic> json) => SignData(
    image: json["name"],
    text: json["text"],
  );

  String toString() => "id: $image, right answers: $text";
}