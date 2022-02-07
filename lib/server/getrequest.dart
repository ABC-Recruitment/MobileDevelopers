import "dart:async";
import 'package:http/http.dart' as http;
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import "package:get/get.dart";
import "package:weather/errorcon.dart";

class GetRequest {
  final String url;
  final Function? callback;

  GetRequest({required this.url, this.callback});

  Future<String> easyConnect() async {
    if (await DataConnectionChecker().hasConnection) {
      try {
        var response = await http
            .get(Uri.parse(url))
            .timeout(const Duration(seconds: 25), onTimeout: () {
          throw Exception("Unable To Connect With Server");
        });
        if (response.statusCode == 200) {
          return response.body;
        } else {
          return "An Error Occured";
        }
      } catch (ex) {
        return ex.toString();
      }
    } else {
      return "Make Sure You Have A Good Internet Connection";
    }
  }

  Future<String> complexConnect() async {
    if (await DataConnectionChecker().hasConnection) {
      try {
        var response = await http
            .get(Uri.parse(url))
            .timeout(const Duration(seconds: 25), onTimeout: () {
          throw Exception("Unable To Connect With Server");
        });
        print("i stoped here_________________");
        if (response.statusCode == 200) {
          return response.body;
        } else {
          Get.off(ErrorCon(callback: callback));
          return "An Error Occured";
        }
      } catch (ex) {
        return ex.toString();
      }
    } else {
      Get.off(ErrorCon(callback: callback));
      return "Make Sure You Have A Good Internet Connection";
    }
  }
 
}
