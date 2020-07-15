# Eralp Software package for Flutter

A Flutter package for help Eralp Software developers.

## Installation

First, add `eralpsoftware` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### Example

``` dart
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
```

## Feedback

Please feel free to [give us any feedback](https://github.com/eralpsoftware/flutter_eralpsoftware/issues)
helping support this package!