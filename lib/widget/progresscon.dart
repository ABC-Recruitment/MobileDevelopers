import "package:flutter/material.dart";

class ProgressCon extends StatelessWidget {
  final String message;
  final Color color;
  const ProgressCon(
      {Key? key, required this.message, this.color = const Color(0xff1A237E)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.grey[300],
          child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 12),
              child: Wrap(
                  runAlignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 10),
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(color),
                    ),
                    const SizedBox(width: 15),
                    Text(message,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14)),
                  ])),
        ));
  }
}
