// viewmodels/dashboard_view_model.dart
import 'package:flutter/material.dart';
import 'package:helmi/models/transaction_model.dart';
import '../models/user.dart';
import '../models/balance.dart';
import '../models/transaction.dart';
import '../models/currency.dart';

class DashboardViewModel extends ChangeNotifier {
  final User _user = User(name: "Helmi Septianto", avatarUrl: "assets/avatar.jpg");
  Balance _totalBalance = Balance(amount: 72829.62, currency: "USD");
  final List<Currency> _currencies = [
    Currency(name: "Bitcoin", symbol: "BTC", balance: 1.1272, rate: 2.15, priceUSD: 67203.95),
    Currency(name: "Ethereum", symbol: "ETH", balance: 0.6948, rate: 1.89, priceUSD: 1801.73),
  ];
  final List<Transaction> _transactions = [
    Transaction(id: "1", type: "USDT to BTC", amount: 0.0116, date: "2023-07-25", convertedAmount: 0.0116, currency: "BTC"),
  ];

  User get user => _user;
  Balance get totalBalance => _totalBalance;
  List<Currency> get currencies => _currencies;
  List<Transaction> get transactions => _transactions;

  // Method untuk mengupdate data atau menambah transaksi jika dibutuhkan
  void updateBalance(double newAmount) {
    _totalBalance = Balance(amount: newAmount, currency: _totalBalance.currency);
    notifyListeners();
  }
}