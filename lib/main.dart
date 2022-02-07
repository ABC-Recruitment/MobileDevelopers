import 'package:flutter/material.dart';
import "package:get/get.dart";
import "package:weather/dashboard.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(home: Dashboard());
  }
}
