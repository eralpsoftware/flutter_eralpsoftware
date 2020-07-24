import 'dart:developer';

import 'package:flutter/material.dart';

class StreamProvider {
  static final StreamProvider _instance = StreamProvider._internal();

  factory StreamProvider() {
    return _instance;
  }

  StreamProvider._internal() {
    log("stream olusturuldu [eralpsoftware.dart]");
  }

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
  }
}
