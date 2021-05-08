import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier {
  String _assetImage = 'assets/azul.png';
  double _size = 9.0;

  String get assetImage => this._assetImage;
  set assetImage(String value) {
    this._assetImage = value;
    notifyListeners();
  }

  double get size => this._size;
  set size(double value) {
    this._size = value;
    notifyListeners();
  }
}
