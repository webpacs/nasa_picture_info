import 'dart:convert';

String nasaModelToJson(Nasa data) => json.encode(data.toJson());

class Nasa {
  DateTime date;
  String explanation;
  String hdurl;
  String mediaType;
  String serviceVersion;
  String title;
  String url;

  Nasa({
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  });

  factory Nasa.fromJson(Map<dynamic, dynamic> json) => Nasa(
        date: DateTime.parse(json["date"]),
        explanation: json["explanation"],
        hdurl: json["hdurl"],
        mediaType: json["media_type"],
        serviceVersion: json["service_version"],
        title: json["title"],
        url: json["url"],
      );

  Map<dynamic, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "explanation": explanation,
        "hdurl": hdurl,
        "media_type": mediaType,
        "service_version": serviceVersion,
        "title": title,
        "url": url,
      };

  factory Nasa.fromJsonString(String str) => Nasa.fromJson(json.decode(str));

  String toJsonString() => json.encode(toJson());

  static List<Nasa> fromJsonList(List list) {
    if (list == null) return null;
    return list.map<Nasa>((item) => Nasa.fromJson(item)).toList();
  }
}
