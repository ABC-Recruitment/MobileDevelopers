import "package:flutter/material.dart";
import 'package:data_connection_checker_tv/data_connection_checker.dart';

class ErrorCon extends StatelessWidget {
  // if there is no network the notifiers are set to true
  static final ValueNotifier network = ValueNotifier(true);
  final Function? callback;
  const ErrorCon({Key? key, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: const Color(0xffe2e2e2),
                height: size.height,
                width: size.width,
                child: Column(children: <Widget>[
                  SizedBox(height: size.height * 0.23),
                  const Icon(Icons.wifi_off_sharp,
                      color: Colors.grey, size: 250),
                  const SizedBox(height: 8),
                  const Text(
                      "Please Make Sure You Have A Good Network Connection",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Color(0xff666666))),
                  const SizedBox(height: 25),
                  ValueListenableBuilder(
                      valueListenable: network,
                      builder: (context, value, widget) {
                        return network.value
                            ? SizedBox(
                                width: size.width * 0.6,
                                height: 43,
                                child: ElevatedButton(
                                    onPressed: () {
                                      retry();
                                    },
                                    child: const Text("Retry"),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.grey))))
                            : const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Colors.grey),
                              );
                      })
                ]))));
  }

  void retry() async {
    network.value = false;
    if (await DataConnectionChecker().hasConnection) {
      await Future.delayed(const Duration(seconds: 1));
      network.value = true;
      callback!();
    } else {
      // if there is no network the notifiers are set to true
      await Future.delayed(const Duration(seconds: 2));
      network.value = true;
    }
  }
}
