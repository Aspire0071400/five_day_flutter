import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * 0.05, vertical: _deviceHeight * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _pageTitle(),
            _imageWidget(),
            _destinationDropDown(),
          ],
        ),
      )),
    );
  }

  Widget _pageTitle() {
    return const Text(
      "#Go Groot",
      style: TextStyle(
          color: Colors.white, fontSize: 75, fontWeight: FontWeight.w800),
      textAlign: TextAlign.center,
    );
  }

  Widget _imageWidget() {
    return Image.asset(
      "assets/p.jpg",
      height: 100,
      width: 100,
    );
  }

  Widget _destinationDropDown() {
    List<String> items = ["Volmir", "Star Station", "Moon Station"];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
      width: _deviceWidth,
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
        value: items.first,
        style: const TextStyle(color: Colors.white),
        items: items.map((e) {
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
