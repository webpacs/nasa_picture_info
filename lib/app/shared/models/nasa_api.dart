import 'dart:convert';

String nasaApiModelToJson(NasaApi data) => json.encode(data.toJson());

class NasaApi {
  DateTime date;
  String explanation;
  String hdurl;
  String mediaType;
  String serviceVersion;
  String title;
  String url;

  NasaApi({
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  });

  factory NasaApi.fromJson(Map<dynamic, dynamic> json) => NasaApi(
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

  factory NasaApi.fromJsonString(String str) =>
      NasaApi.fromJson(json.decode(str));

  String toJsonString() => json.encode(toJson());

  static List<NasaApi> fromJsonList(List list) {
    if (list == null) return null;
    return list.map<NasaApi>((item) => NasaApi.fromJson(item)).toList();
  }
}
