

class SignData{
  String image;
  String text;

  SignData({this.image, this.text});

  factory SignData.fromJson(Map<String, dynamic> json) => SignData(
    image: json["image"],
    text: json["text"],
  );

  String toString() => "image: $image, text: $text";
}