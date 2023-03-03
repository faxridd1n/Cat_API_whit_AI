// To parse this JSON data, do
//
//     final photos = photosFromJson(jsonString);

import 'dart:convert';

List<Photos> photosFromJson(String str) => List<Photos>.from(json.decode(str).map((x) => Photos.fromJson(x)));

String photosToJson(List<Photos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photos {
    Photos({
        required this.id,
        required this.url,
        required this.width,
        required this.height,
    });

    String id;
    String url;
    int width;
    int height;

    factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "width": width,
        "height": height,
    };
}
