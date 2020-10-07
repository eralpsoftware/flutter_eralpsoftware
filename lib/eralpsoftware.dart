library eralpsoftware;

import 'dart:async';
import 'dart:math';

import 'package:eralpsoftware/eralp_notification/eralp_notification.dart';
import 'package:eralpsoftware/pages/splash_page.dart';
import 'package:eralpsoftware/providers/global_provider.dart';
import 'package:eralpsoftware/providers/stream_provider.dart';
import 'package:eralpsoftware/validators/validators.dart';
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
    sqrt(pow(xdScreenSize.height, 2) + pow(xdScreenSize.width, 2));
    return Size(
      (xdContainerSize.width * size.width) / (xdScreenSize.width),
      (xdContainerSize.height * size.height) / (xdScreenSize.height),
    );
  }
}

class EralpSoft extends StatefulWidget {
  final BuildContext context;
  final MaterialApp child;
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
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      key: _globalScaffoldKey,
      body: widget.child,
    );
  }
}

class Eralp {
  static Widget builder(
      {@required BuildContext context, @required Widget child}) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

  static void showAlertDialog({
    bool dismissible = true,
    Widget title,
    Widget content,
    Color backgroundColor = Colors.white,
    String okString,
    Function onOkPressed,
  }) {
    showDialog(
      barrierDismissible: dismissible,
      context: _globalProvider.globalContext,
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          title: title,
          content: content,
          actions: <Widget>[
            FlatButton(
              child: Text(okString),
              onPressed: () {
                Navigator.pop(_globalProvider.globalContext);
                onOkPressed();
              },
            ),
          ],
        );
      },
    );
  }

  static void showProgress() {
    showDialog(
      barrierDismissible: false,
      context: _globalProvider.globalContext,
      builder: (context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pop(_globalProvider.globalContext);
          print("asdasd");
        });
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  static void startProgress({@required int maxSecond, @required Widget child}) {
    StreamProvider _streamProvider = StreamProvider();
    _streamProvider.isLoading = true;
    int count = 0;

    showDialog(
      barrierDismissible: false,
      context: _globalProvider.globalContext,
      builder: (context) {
        Timer.periodic(const Duration(milliseconds: 250), (Timer t) {
          count++;
          if (!_streamProvider.isLoading) {
            t.cancel();
            // Navigator.pop(_globalProvider.globalContext);
            Navigator.of(_globalProvider.globalContext, rootNavigator: true)
                .pop();
          } else if (count >= maxSecond * 4) {
            t.cancel();
            // Navigator.pop(_globalProvider.globalContext);
            Navigator.of(_globalProvider.globalContext, rootNavigator: true)
                .pop();
          }
        });

        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: child,
          ),
        );
      },
    );
  }

  static void stopProgress() {
    StreamProvider().isLoading = false;
  }

  static void startProgressForXSecond(
      {@required double second, @required Widget child}) {
    int count = 0;

    showDialog(
      barrierDismissible: false,
      context: _globalProvider.globalContext,
      builder: (context) {
        Timer.periodic(const Duration(milliseconds: 250), (Timer t) {
          count++;
          if (count >= (second * 4).toInt()) {
            t.cancel();
            Navigator.of(_globalProvider.globalContext, rootNavigator: true)
                .pop();
          }
        });

        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: child,
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

  static RegisterValidator validator() {
    RegisterValidator _validator = RegisterValidator();
    return _validator;
  }

  static Widget splashPage() {
    return SplashPage();
  }

  static void showEralpNotification({
    @required Widget child,
    Duration duration,
    bool showProgressIndicator,
    final Color progressBackgroundColor,
    final Color progressValueColor,
  }) {
    final _showEralpBar = ShowEralpNotification(
      child: child,
      duration: duration ?? null,
      showProgressIndicator: showProgressIndicator ?? false,
      progressBackgroundColor: progressBackgroundColor,
      progressValueColor: progressValueColor,
    );
    _showEralpBar.show(_globalProvider.globalContext);
  }
}
