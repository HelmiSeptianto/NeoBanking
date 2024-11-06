// models/user.dart
class User {
  final String name;
  final String avatarUrl;

  User({required this.name, required this.avatarUrl});
}

// models/balance.dart
class Balance {
  final double amount;
  final String currency;

  Balance({required this.amount, required this.currency});
}

// models/transaction.dart
class Transaction {
  final String id;
  final String type;
  final double amount;
  final String date;
  final double convertedAmount;
  final String currency;

  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
    required this.convertedAmount,
    required this.currency,
  });
}

// models/currency.dart
class Currency {
  final String name;
  final String symbol;
  final double balance;
  final double rate;
  final double priceUSD;

  Currency({
    required this.name,
    required this.symbol,
    required this.balance,
    required this.rate,
    required this.priceUSD,
  });
}