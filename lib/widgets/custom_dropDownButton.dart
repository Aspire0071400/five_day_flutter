import 'package:flutter/material.dart';

class CustomDropdownbutton extends StatelessWidget {
  List<String> values;
  double width;

  CustomDropdownbutton({required this.width, required this.values});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      width: width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(52, 52, 52, 1.0),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: DropdownButton(
        borderRadius: const BorderRadius.all(Radius.elliptical(5, 5)),
        iconEnabledColor: Colors.white,
        underline: Container(),
        value: values.first,
        style: const TextStyle(color: Colors.white),
        items: values.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e),
          );
        }).toList(),
        onChanged: (_) {},
        dropdownColor: const Color.fromRGBO(53, 53, 53, 1.0),
      ),
    );
  }
}
