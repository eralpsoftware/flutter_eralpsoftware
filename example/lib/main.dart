import 'package:eralpsoftware/eralpsoftware.dart';
import 'package:example/route_generator/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Eralp.builder(
      context: context,
      child: MaterialApp(
        // navigatorKey: Eralp.navigatorKey(),
        // builder: (context, child) {
        //   return Eralp.builder(
        //     context: context,
        //     child: child,
        //   );
        // },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: "/",
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
