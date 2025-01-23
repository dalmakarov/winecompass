import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _graphQLimageURL = 'https://kultovo.ru/media/';
  String get graphQLimageURL => _graphQLimageURL;
  set graphQLimageURL(String value) {
    _graphQLimageURL = value;
  }

  String _debugVal = '';
  String get debugVal => _debugVal;
  set debugVal(String value) {
    _debugVal = value;
  }

  String _debugVal2 = '';
  String get debugVal2 => _debugVal2;
  set debugVal2(String value) {
    _debugVal2 = value;
  }

  bool _ToggleMockUp0 = false;
  bool get ToggleMockUp0 => _ToggleMockUp0;
  set ToggleMockUp0(bool value) {
    _ToggleMockUp0 = value;
  }

  bool _ToggleMockUp1 = false;
  bool get ToggleMockUp1 => _ToggleMockUp1;
  set ToggleMockUp1(bool value) {
    _ToggleMockUp1 = value;
  }
}
