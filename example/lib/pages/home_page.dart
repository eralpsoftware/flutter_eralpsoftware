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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Eralp.showSnackBar(
                  snackBar: SnackBar(
                    content: Text("normal snackbar"),
                  ),
                );
              },
              child: Text("normal snackbar"),
            ),
            RaisedButton(
              onPressed: () {
                Eralp.showSnackBar(
                  snackBar: SnackBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    content: Text(
                      "primary background color snackbar",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                );
              },
              child: Text("primary background color snackbar"),
            ),
            RaisedButton(
              onPressed: () {
                Eralp.showSnackBar(
                  snackBar: SnackBar(
                    backgroundColor: Theme.of(context).errorColor,
                    content: Text("error snackbar"),
                  ),
                );
              },
              child: Text("error snackbar"),
            ),
            RaisedButton(
              onPressed: () {
                Eralp.showAlertDialog();
              },
              child: Text("show dialog"),
            ),
            RaisedButton(
              onPressed: () {
                Eralp.showUndismissibleAlertDialog();
              },
              child: Text("show undismissible dialog"),
            ),
            RaisedButton(
              onPressed: () {
                Eralp.showProgress();
              },
              child: Text("start untouchable progressbar for 3 seconds"),
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
