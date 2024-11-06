import 'package:flutter/material.dart';

class DashboardTheme {
  static const Color primaryColor = Colors.white;
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color cardColor = Colors.grey;
  static const Color tabBarColor = Colors.grey;
  static const Color selectedTabColor = Colors.white;
  static const Color unselectedTabColor = Colors.grey;
  static const Color bottomNavBackgroundColor = Colors.grey;

  static const TextStyle balanceTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle labelTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.grey,
  );

  static const TextStyle tabLabelStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle actionLabelStyle = TextStyle(
    fontSize: 12,
    color: Colors.black,
  );
}
