import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _ToggleMockUp1 = prefs.getBool('ff_ToggleMockUp1') ?? _ToggleMockUp1;
    });
    _safeInit(() {
      _SelectedYear = prefs.getInt('ff_SelectedYear') ?? _SelectedYear;
    });
    _safeInit(() {
      _WinesYear =
          prefs.getStringList('ff_WinesYear')?.map(int.parse).toList() ??
              _WinesYear;
    });
    _safeInit(() {
      _WinesRate =
          prefs.getStringList('ff_WinesRate')?.map(double.parse).toList() ??
              _WinesRate;
    });
    _safeInit(() {
      _WinesImage = prefs.getStringList('ff_WinesImage') ?? _WinesImage;
    });
    _safeInit(() {
      _WineGastronomy = prefs.getString('ff_WineGastronomy') ?? _WineGastronomy;
    });
    _safeInit(() {
      _userMail = prefs.getString('ff_userMail') ?? _userMail;
    });
    _safeInit(() {
      _userPassword = prefs.getString('ff_userPassword') ?? _userPassword;
    });
    _safeInit(() {
      _userLoggedIn = prefs.getBool('ff_userLoggedIn') ?? _userLoggedIn;
    });
    _safeInit(() {
      _userName = prefs.getString('ff_userName') ?? _userName;
    });
    _safeInit(() {
      _offerAccept = prefs.getBool('ff_offerAccept') ?? _offerAccept;
    });
    _safeInit(() {
      _currentCountry = prefs.getString('ff_currentCountry') ?? _currentCountry;
    });
    _safeInit(() {
      _activeFavoriteItem =
          prefs.getString('ff_activeFavoriteItem') ?? _activeFavoriteItem;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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
    prefs.setBool('ff_ToggleMockUp1', value);
  }

  int _SelectedYear = 0;
  int get SelectedYear => _SelectedYear;
  set SelectedYear(int value) {
    _SelectedYear = value;
    prefs.setInt('ff_SelectedYear', value);
  }

  List<int> _WinesYear = [];
  List<int> get WinesYear => _WinesYear;
  set WinesYear(List<int> value) {
    _WinesYear = value;
    prefs.setStringList(
        'ff_WinesYear', value.map((x) => x.toString()).toList());
  }

  void addToWinesYear(int value) {
    WinesYear.add(value);
    prefs.setStringList(
        'ff_WinesYear', _WinesYear.map((x) => x.toString()).toList());
  }

  void removeFromWinesYear(int value) {
    WinesYear.remove(value);
    prefs.setStringList(
        'ff_WinesYear', _WinesYear.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromWinesYear(int index) {
    WinesYear.removeAt(index);
    prefs.setStringList(
        'ff_WinesYear', _WinesYear.map((x) => x.toString()).toList());
  }

  void updateWinesYearAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    WinesYear[index] = updateFn(_WinesYear[index]);
    prefs.setStringList(
        'ff_WinesYear', _WinesYear.map((x) => x.toString()).toList());
  }

  void insertAtIndexInWinesYear(int index, int value) {
    WinesYear.insert(index, value);
    prefs.setStringList(
        'ff_WinesYear', _WinesYear.map((x) => x.toString()).toList());
  }

  List<double> _WinesRate = [];
  List<double> get WinesRate => _WinesRate;
  set WinesRate(List<double> value) {
    _WinesRate = value;
    prefs.setStringList(
        'ff_WinesRate', value.map((x) => x.toString()).toList());
  }

  void addToWinesRate(double value) {
    WinesRate.add(value);
    prefs.setStringList(
        'ff_WinesRate', _WinesRate.map((x) => x.toString()).toList());
  }

  void removeFromWinesRate(double value) {
    WinesRate.remove(value);
    prefs.setStringList(
        'ff_WinesRate', _WinesRate.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromWinesRate(int index) {
    WinesRate.removeAt(index);
    prefs.setStringList(
        'ff_WinesRate', _WinesRate.map((x) => x.toString()).toList());
  }

  void updateWinesRateAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    WinesRate[index] = updateFn(_WinesRate[index]);
    prefs.setStringList(
        'ff_WinesRate', _WinesRate.map((x) => x.toString()).toList());
  }

  void insertAtIndexInWinesRate(int index, double value) {
    WinesRate.insert(index, value);
    prefs.setStringList(
        'ff_WinesRate', _WinesRate.map((x) => x.toString()).toList());
  }

  List<String> _WinesImage = [];
  List<String> get WinesImage => _WinesImage;
  set WinesImage(List<String> value) {
    _WinesImage = value;
    prefs.setStringList('ff_WinesImage', value);
  }

  void addToWinesImage(String value) {
    WinesImage.add(value);
    prefs.setStringList('ff_WinesImage', _WinesImage);
  }

  void removeFromWinesImage(String value) {
    WinesImage.remove(value);
    prefs.setStringList('ff_WinesImage', _WinesImage);
  }

  void removeAtIndexFromWinesImage(int index) {
    WinesImage.removeAt(index);
    prefs.setStringList('ff_WinesImage', _WinesImage);
  }

  void updateWinesImageAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    WinesImage[index] = updateFn(_WinesImage[index]);
    prefs.setStringList('ff_WinesImage', _WinesImage);
  }

  void insertAtIndexInWinesImage(int index, String value) {
    WinesImage.insert(index, value);
    prefs.setStringList('ff_WinesImage', _WinesImage);
  }

  String _WineGastronomy = '';
  String get WineGastronomy => _WineGastronomy;
  set WineGastronomy(String value) {
    _WineGastronomy = value;
    prefs.setString('ff_WineGastronomy', value);
  }

  String _userMail = '';
  String get userMail => _userMail;
  set userMail(String value) {
    _userMail = value;
    prefs.setString('ff_userMail', value);
  }

  String _userPassword = '';
  String get userPassword => _userPassword;
  set userPassword(String value) {
    _userPassword = value;
    prefs.setString('ff_userPassword', value);
  }

  bool _userLoggedIn = false;
  bool get userLoggedIn => _userLoggedIn;
  set userLoggedIn(bool value) {
    _userLoggedIn = value;
    prefs.setBool('ff_userLoggedIn', value);
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    prefs.setString('ff_userName', value);
  }

  bool _offerAccept = false;
  bool get offerAccept => _offerAccept;
  set offerAccept(bool value) {
    _offerAccept = value;
    prefs.setBool('ff_offerAccept', value);
  }

  String _currentCountry = '';
  String get currentCountry => _currentCountry;
  set currentCountry(String value) {
    _currentCountry = value;
    prefs.setString('ff_currentCountry', value);
  }

  int _ActiveTabIndex = 0;
  int get ActiveTabIndex => _ActiveTabIndex;
  set ActiveTabIndex(int value) {
    _ActiveTabIndex = value;
  }

  bool _emailMatch = false;
  bool get emailMatch => _emailMatch;
  set emailMatch(bool value) {
    _emailMatch = value;
  }

  String _activeFavoriteItem = '';
  String get activeFavoriteItem => _activeFavoriteItem;
  set activeFavoriteItem(String value) {
    _activeFavoriteItem = value;
    prefs.setString('ff_activeFavoriteItem', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
