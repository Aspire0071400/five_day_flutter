import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Taskly extends StatefulWidget {
  const Taskly({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TasklyState();
  }
}

class _TasklyState extends State<Taskly> {
  String? _newTaskContent;
  _TasklyState();

  late double _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Taskly",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        toolbarHeight: _deviceHeight * 0.15,
      ),
      body: _taskList(),
      floatingActionButton: _floatingButton(),
    );
  }

  Widget _floatingButton() {
    return FloatingActionButton(
      onPressed: _displayTaskPopup,
      backgroundColor: Colors.redAccent,
      shape: const StadiumBorder(),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  void _displayTaskPopup() {
    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: TextField(
            onSubmitted: (_value) {},
            onChanged: (_value) {
              setState(() {
                _newTaskContent = _value;
              });
            },
          ),
        );
      },
    );
  }

  Widget _taskList() {
    return ListView(children: [
      ListTile(
        title: const Text(
          "DO Laundry",
          style:
              TextStyle(decoration: TextDecoration.lineThrough, fontSize: 20),
        ),
        subtitle: Text(
          DateTime.now().toString(),
        ),
        trailing: const Icon(
          Icons.check_box_outlined,
          color: Colors.red,
          size: 30,
        ),
      ),
    ]);
  }
}
