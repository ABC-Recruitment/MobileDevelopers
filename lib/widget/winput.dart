import "package:flutter/material.dart";
import "package:flutter/services.dart";

class MyInput extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputFormatter? inputFormmter;
  final Function(String) inputChanged;
  const MyInput(
      {Key? key,
      required this.icon,
      required this.hintText,
      required this.controller,
      required this.keyboardType,
      required this.inputChanged,
      this.inputFormmter})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 55,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffe2e2e2)),
      child: TextField(
        obscureText: false,
        onChanged: (value) {
          inputChanged(value);
        },
        inputFormatters: <TextInputFormatter>[
          inputFormmter ?? LengthLimitingTextInputFormatter(50)
        ],
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: (hintText),
            border: InputBorder.none,
            icon: Icon(icon, size: 19)),
      ),
    );
  }
}

class MyInput2 extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  const MyInput2({Key? key, required this.child, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Container(
            alignment: Alignment.centerLeft,
            height: 55,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xffe2e2e2)),
            child: child));
  }
}

class MyInput3 extends StatelessWidget {
  final Widget child;
  final double height;
  const MyInput3({
    Key? key,
    required this.child,
    required this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: height,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xffe2e2e2)),
        child: child);
  }
}
