import 'package:eralpsoftware/eralpsoftware.dart';
import 'package:flutter/material.dart';

class ContextPage extends StatefulWidget {
  ContextPage({Key key}) : super(key: key);

  @override
  _ContextPageState createState() => _ContextPageState();
}

class _ContextPageState extends State<ContextPage> {
  final TextEditingController _secondController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Context Page'),
      ),
      body: ListView(
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
              Eralp.showAlertDialog(
                title: Text("title"),
                content: Text("content"),
                okString: "ok",
                onOkPressed: () {},
              );
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
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  onPressed: () async {
                    Eralp.startProgress(maxSecond: 2, child: Text("123"));
                    // await Future.delayed(
                    //     Duration(seconds: int.parse(_secondController.text)));
                    // Eralp.stopProgress();
                  },
                  child: Text("start progressbar for"),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _secondController,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text("second(default 5)"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          RaisedButton(
            onPressed: () {
              Eralp.showEralpNotification(
                child: Text("the quick brown fox jumps over the lazy dog"),
                duration: Duration(milliseconds: 2500),
                showProgressIndicator: false,
              );
            },
            child: Text("show eralp notification"),
          ),
          RaisedButton(
            onPressed: () {
              Eralp.showEralpNotification(
                child: Text("the quick brown fox jumps over the lazy dog"),
                duration: Duration(milliseconds: 2500),
                showProgressIndicator: true,
              );
            },
            child: Text("show eralp notification w/ notification"),
          ),
          RaisedButton(
            onPressed: () {
              Eralp.showEralpNotification(
                child: Text("the quick brown fox jumps over the lazy dog"),
                duration: Duration(milliseconds: 2500),
                showProgressIndicator: true,
                progressBackgroundColor: Colors.green,
                progressValueColor: Colors.black,
              );
            },
            child:
                Text("show eralp notification w/ notification w/ custom color"),
          ),
        ],
      ),
    );
  }
}
