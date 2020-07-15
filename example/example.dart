import 'package:eralpsoftware/eralpsoftware.dart';
import 'package:flutter/material.dart';

class MyExample extends StatefulWidget {
  const MyExample({Key key}) : super(key: key);

  @override
  _MyExampleState createState() => _MyExampleState();
}

class _MyExampleState extends State<MyExample> {
  final Calculator _calculator = Calculator();

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Container(
        child: Center(
          child: Text("$_count"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        child: Icon(Icons.add),
      ),
    );
  }

  void onPressed() {
    setState(() {
      _count += _calculator.addOne(_count);
    });
  }
}
