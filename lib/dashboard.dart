import "package:flutter/material.dart";
import "package:weather/widget/winput.dart" as myinput;
import "package:get/get.dart";
import "package:weather/widget/progresscon.dart";
import "package:weather/server/getrequest.dart";
import "dart:convert" as convert;
import "package:flutter/services.dart";
import "package:weather/model/datahelper.dart";
import "package:weather/model/serializer.dart" as model;
import "package:weather/views/forcast.dart";

class Dashboard extends StatelessWidget {
  final cityName = TextEditingController();
  final ValueNotifier nf = ValueNotifier(false);

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xFF011B72)));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
      SizedBox(height: 0.13 * size.height),
      const Text("Weather App", style: TextStyle(fontSize: 25)),
      const SizedBox(height: 20),
      myinput.MyInput(
        controller: cityName,
        hintText: "Enter Name Of City",
        icon: Icons.location_city_outlined,
        keyboardType: TextInputType.emailAddress,
        inputChanged: (value) {},
      ),
      const SizedBox(height: 25),
      Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(11)),
              gradient: LinearGradient(
                  end: Alignment.bottomRight,
                  begin: Alignment.topLeft,
                  colors: <Color>[
                    Colors.red,
                    Colors.red[600] ?? Colors.red,
                    Colors.red[700] ?? Colors.red,
                  ])),
          height: 45,
          width: size.width * 0.8,
          child: ElevatedButton(
              onPressed: () {
                _check(context);
              },
              child: const Text("Check Weather",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)))),
      const SizedBox(height: 20),
      nf.value
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ValueListenableBuilder(
                  valueListenable: nf,
                  builder: (context, value, widget) {
                    return DataHelper.description == "" && nf.value == true
                        ? const Center(child: Text("City Not Found"))
                        : Column(children: <Widget>[
                            Forcast(
                                description: DataHelper.description ?? "",
                                temperature: DataHelper.temperature ?? "",
                                wind: DataHelper.wind ?? ""),
                            //day 1
                            const SizedBox(height: 10),
                            const Center(
                                child: Text("Day 1 Forcast ",
                                    style: TextStyle(fontSize: 19))),
                            Forcast2(
                                temperature: DataHelper.forcast[0].temperature,
                                wind: DataHelper.forcast[0].wind),

                            //day 2
                            const SizedBox(height: 10),
                            const Center(
                                child: Text("Day 2 Forcast ",
                                    style: TextStyle(fontSize: 19))),
                            Forcast2(
                                temperature: DataHelper.forcast[1].temperature,
                                wind: DataHelper.forcast[1].wind),

                            //day3
                            const SizedBox(height: 10),
                            const Center(
                                child: Text("Day 3 Forcast ",
                                    style: TextStyle(fontSize: 19))),
                            Forcast2(
                                temperature: DataHelper.forcast[2].temperature,
                                wind: DataHelper.forcast[2].wind),
                          ]);
                  }))
          : const SizedBox(height: 10),
    ]))));
  }

  void _check(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    String city = cityName.text;
    if (city.length < 4) {
      Get.snackbar("Error", "Please Enter A Valid City Name",
          colorText: Colors.black);
      return;
    }
    nf.value = false;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          const ProgressCon(message: "Getting Weather Forecast"),
    );
    GetRequest(
        url: "https://goweather.herokuapp.com/weather/$city",
        callback: () {
          Get.off(Dashboard());
        }).complexConnect().then((response) {
      nf.value = true;
      Navigator.pop(context);
      Map<String, dynamic> data = convert.jsonDecode(response);
      DataHelper.temperature = data['temperature'];
      DataHelper.description = data['description'];
      DataHelper.wind = data['wind'];
      DataHelper.forcast = model.serializerFromJson(response).forecast;
      // print(DataHelper.forcast);

      cityName.text = "";
      print(response);
      try {} catch (ex) {
        Get.snackbar("error", ex.toString(), colorText: Colors.black);
        return;
      }
    });
  }
}
