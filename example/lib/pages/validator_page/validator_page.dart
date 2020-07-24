import 'package:eralpsoftware/eralpsoftware.dart';
import 'package:flutter/material.dart';

class ValidatorPage extends StatefulWidget {
  ValidatorPage({Key key}) : super(key: key);

  @override
  _ValidatorPageState createState() => _ValidatorPageState();
}

class _ValidatorPageState extends State<ValidatorPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Validator Page'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "fullname"),
              validator: Eralp.validator().fullnameValidator,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "e-mail"),
              validator: Eralp.validator().mailValidator,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "password"),
              validator: Eralp.validator().passwordValidator,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "phone"),
              validator: Eralp.validator().phoneValidator,
            ),
            RaisedButton(
              child: Text("validate"),
              onPressed: () {
                _formKey.currentState.validate();
              },
            )
          ],
        ),
      ),
    );
  }
}
