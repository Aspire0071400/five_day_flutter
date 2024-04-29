import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Second Page, $args",
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 5,
        shadowColor: Colors.black,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.of(context).pop("this is from second screen");
            },
            child: const Text("POP2")),
      ),
    );
  }
}
