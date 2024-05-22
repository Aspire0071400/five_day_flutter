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
        child: Center(child: _destinationDropDown()),
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
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/p.jpg"), fit: BoxFit.contain)),
    );
  }

  Widget _destinationDropDown() {
    List<DropdownMenuItem> items =
        ["Volmir", "Star Station", "Moon Station"].map((e) {
      return DropdownMenuItem(
        value: e,
        child: Text(e),
      );
    }).toList();
    return DropdownButton(
      borderRadius: const BorderRadius.all(Radius.elliptical(5, 5)),
      iconEnabledColor: Colors.white,
      items: items,
      onChanged: (_) {},
      dropdownColor: Colors.blue.shade200,
      hint: const Text(
        "Select",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
