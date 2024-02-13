import 'package:flutter/material.dart';

class ProviderClass extends ChangeNotifier {
  bool isSignUp = true;
  void updateWidget() {
    isSignUp = !isSignUp;
    notifyListeners();
  }
}