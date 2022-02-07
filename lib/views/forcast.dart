import "package:flutter/material.dart";

class Forcast extends StatelessWidget {
  final String temperature;
  final String wind;
  final String description;
  Forcast(
      {Key? key,
      required this.temperature,
      required this.wind,
      required this.description});

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: <Widget>[
          const Text("Temperature:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(width: 2),
          Text(temperature),
        ]),
        SizedBox(height: 7),
        Row(children: <Widget>[
          const Text("Wind:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(width: 2),
          Text(wind),
        ]),
        SizedBox(height: 7),
        Row(children: <Widget>[
          const Text("Descriptioin:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(width: 2),
          Text(description),
        ]),
        SizedBox(height: 7),
      ],
    );
  }
}

class Forcast2 extends StatelessWidget {
  final String temperature;
  final String wind;
  Forcast2({Key? key, required this.temperature, required this.wind});

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: <Widget>[
          const Text("Temperature:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(width: 2),
          Text(temperature),
        ]),
        SizedBox(height: 7),
        Row(children: <Widget>[
          const Text("Wind:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(width: 2),
          Text(wind),
        ]),
      ],
    );
  }
}
