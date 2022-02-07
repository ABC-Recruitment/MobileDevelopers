// To parse this JSON data, do
//
//     final serializer = serializerFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Serializer serializerFromJson(String str) =>
    Serializer.fromJson(json.decode(str));

String serializerToJson(Serializer data) => json.encode(data.toJson());

class Serializer {
  Serializer({
    required this.temperature,
    required this.wind,
    required this.description,
    required this.forecast,
  });

  final String temperature;
  final String wind;
  final String description;
  final List<Forecast> forecast;

  factory Serializer.fromJson(Map<String, dynamic> json) => Serializer(
        temperature: json["temperature"],
        wind: json["wind"],
        description: json["description"],
        forecast: List<Forecast>.from(
            json["forecast"].map((x) => Forecast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "wind": wind,
        "description": description,
        "forecast": List<dynamic>.from(forecast.map((x) => x.toJson())),
      };
}

class Forecast {
  Forecast({
    required this.day,
    required this.temperature,
    required this.wind,
  });

  final String day;
  final String temperature;
  final String wind;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        day: json["day"],
        temperature: json["temperature"],
        wind: json["wind"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "temperature": temperature,
        "wind": wind,
      };
}
