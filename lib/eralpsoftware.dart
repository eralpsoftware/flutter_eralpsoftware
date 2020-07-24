library eralpsoftware;

import 'dart:math';

import 'package:eralpsoftware/providers/global_provider.dart';
import 'package:flutter/material.dart';

final GlobalProvider _globalProvider = GlobalProvider();

/// Bu calculator class'i gonderilen value'ye 1 ekler.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class XdHelper {
  static double getScaledFontSize({
    @required Size size,
    @required double fontSize,
    @required Size xdScreenSize,
  }) {
    double sizeRatio = sqrt(pow(size.height, 2) + pow(size.width, 2));
    double xdRatio =
        sqrt(pow(xdScreenSize.height, 2) + pow(xdScreenSize.width, 2));
    return fontSize * sizeRatio / xdRatio;
  }

  static double getScaledDouble({
    @required Size size,
    @required double xdDouble,
    @required Size xdScreenSize,
  }) {
    double sizeRatio = sqrt(pow(size.height, 2) + pow(size.width, 2));
    double xdRatio =
        sqrt(pow(xdScreenSize.height, 2) + pow(xdScreenSize.width, 2));
    return xdDouble * sizeRatio / xdRatio;
  }

  static Size getScaledSize({
    @required Size size,
    @required Size xdContainerSize,
    @required Size xdScreenSize,
  }) {
    double sizeRatio = sqrt(pow(size.height, 2) + pow(size.width, 2));
    double xdRatio =
        sqrt(pow(xdScreenSize.height, 2) + pow(xdScreenSize.width, 2));
    return Size(
      (xdContainerSize.width * size.width) / (xdScreenSize.width),
      (xdContainerSize.height * size.height) / (xdScreenSize.height),
    );
  }
}

class EralpSoft extends StatefulWidget {
  final BuildContext context;
  final Widget child;
  EralpSoft({
    Key key,
    @required this.context,
    @required this.child,
  }) : super(key: key);

  @override
  _EralpSoftState createState() => _EralpSoftState();
}

class _EralpSoftState extends State<EralpSoft> {
  GlobalKey<ScaffoldState> _globalScaffoldKey;

  @override
  void initState() {
    super.initState();
    _globalScaffoldKey = GlobalKey<ScaffoldState>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _globalProvider.globalContext = context;
      _globalProvider.globalScaffoldKey = _globalScaffoldKey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalScaffoldKey,
      body: widget.child,
    );
  }
}

class Eralp {
  static Widget builder(
      {@required BuildContext context, @required Widget child}) {
    return MaterialApp(
      home: EralpSoft(
        context: context,
        child: child,
      ),
    );
  }

  static GlobalKey<NavigatorState> navigatorKey() {
    final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
    _globalProvider.navigatorKey = _navigatorKey;
    return _navigatorKey;
  }

  static void showSnackBar({@required SnackBar snackBar}) {
    _globalProvider.globalScaffoldKey.currentState.showSnackBar(snackBar);
  }

  static void showAlertDialog() {
    showDialog(
      context: _globalProvider.globalContext,
      builder: (context) {
        return AlertDialog(
          title: Text("simple alert dialog"),
          actions: <Widget>[
            FlatButton(
              child: Text("ok"),
              onPressed: () {
                Navigator.pop(_globalProvider.globalContext);
              },
            ),
          ],
        );
      },
    );
  }

  static void showUndismissibleAlertDialog() {
    showDialog(
      barrierDismissible: false,
      context: _globalProvider.globalContext,
      builder: (context) {
        return AlertDialog(
          title: Text("undismissible alert dialog"),
          actions: <Widget>[
            FlatButton(
              child: Text("ok"),
              onPressed: () {
                Navigator.pop(_globalProvider.globalContext);
              },
            ),
          ],
        );
      },
    );
  }
}
