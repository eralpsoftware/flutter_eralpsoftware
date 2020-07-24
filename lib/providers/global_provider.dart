import 'package:flutter/material.dart';

class GlobalProvider {
  static final GlobalProvider _instance = GlobalProvider._internal();

  factory GlobalProvider() {
    return _instance;
  }

  GlobalProvider._internal() {
    print("DeviceConfig oluşturuldu");
  }

  Size _size;
  Size get size => _size;
  set size(Size size) {
    _size = size;
    print("setted size");
  }

  BuildContext _globalContext;
  BuildContext get globalContext => _globalContext;
  set globalContext(BuildContext context) {
    _globalContext = context;
    print("setted buildContext");
  }

  GlobalKey<ScaffoldState> _globalScaffoldKey;
  GlobalKey<ScaffoldState> get globalScaffoldKey => _globalScaffoldKey;
  set globalScaffoldKey(GlobalKey<ScaffoldState> scaffoldKey) {
    _globalScaffoldKey = scaffoldKey;
    print("setted globalScaffoldKey");
  }

  GlobalKey<NavigatorState> _navigatorKey;
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  set navigatorKey(GlobalKey<NavigatorState> nKey) {
    _navigatorKey = nKey;
    print("setted navigatorKey");
  }
}
