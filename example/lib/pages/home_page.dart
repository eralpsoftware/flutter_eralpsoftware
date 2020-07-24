import 'package:eralpsoftware/eralpsoftware.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, "/contextPage"),
              child: Text("go to the context page"),
            ),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, "/validatorPage"),
              child: Text("go to the validator page"),
            ),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, "/splashPage"),
              child: Text("go to the splash page"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.notifications),
      ),
    );
  }
}
