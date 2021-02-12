import 'dart:convert';

List<Place> placeFromJson(String str) => List<Place>.from(json.decode(str).map((x) => Place.fromJson(x)));

String placeToJson(List<Place> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Place {
  Place({
    this.city,
    this.description,
    this.country,
    this.image,
    this.id,
    this.name,
  });

  String city;
  String description;
  String country;
  String image;
  int id;
  String name;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        city: json["city"],
        description: json["description"],
        country: json["country"],
        image: json["image"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "description": description,
        "country": country,
        "image": image,
        "id": id,
        "name": name,
      };
}
