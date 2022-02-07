import "dart:convert" as convert;
import "package:weather/model/serializer.dart";
import 'package:weather/views/forcast.dart';

class DataHelper {
  static String? temperature;
  static String? wind;
  static String? description;
  static List<dynamic> forcast = [];
}
