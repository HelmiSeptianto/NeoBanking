// TODO Implement this library.import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class DashboardViewModel with ChangeNotifier {
  double totalBalance = 72829.62;
  double btcAmount = 1.1272;
  double ethAmount = 0.6948;
  int selectedTab = 0;

  void setSelectedTab(int index) {
    selectedTab = index;
    notifyListeners();
  }
}
