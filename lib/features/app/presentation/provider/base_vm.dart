import 'package:flutter/material.dart';

class BaseVm extends ChangeNotifier {
  int selectedIndex = 0;
  PageController pageController = PageController();

  void update() {
    notifyListeners();
  }
}
