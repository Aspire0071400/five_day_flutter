import 'package:five_day_flutter/widgets/custom_dropDownButton.dart';
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
            _bookaRide(),
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

  Widget _rideButton() {
    return Container(
      margin: EdgeInsets.only(bottom: _deviceHeight * 0.005),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: () {},
        child: const Text(
          "Book a Ride!!",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _bookaRide() {
    return Container(
      height: _deviceHeight * 0.22,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _destinationDropDown(),
          _travellersInformation(),
          _rideButton(),
        ],
      ),
    );
  }

  Widget _imageWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/p.jpg",
          //height: 100,
          width: 300,
        ),
      ],
    );
  }

  Widget _destinationDropDown() {
    return CustomDropdownbutton(
      width: _deviceWidth,
      values: const ["Volmir", "Star Station", "Moon Station"],
    );
  }

  Widget _travellersInformation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDropdownbutton(
          width: _deviceWidth * 0.44,
          values: const ["1", "2", "3", "4"],
        ),
        CustomDropdownbutton(
          width: _deviceWidth * 0.4,
          values: const ["Economy", "Business", "First", "Private"],
        ),
      ],
    );
  }
}
