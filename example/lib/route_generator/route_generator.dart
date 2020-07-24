import 'package:eralpsoftware/eralpsoftware.dart';
import 'package:example/pages/context_page/context_page.dart';
import 'package:example/pages/home_page.dart';
import 'package:example/pages/validator_page/validator_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/contextPage':
        return MaterialPageRoute(builder: (context) => ContextPage());
      case '/validatorPage':
        return MaterialPageRoute(builder: (context) => ValidatorPage());
      case '/splashPage':
        return MaterialPageRoute(builder: (context) => Eralp.splashPage());
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}
