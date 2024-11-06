// main.dart
import 'package:flutter/material.dart';
import 'package:helmi/viewmodels/dashboard_viewmodel.dart';
import 'package:provider/provider.dart';
import 'views/dashboard_view.dart';
import 'package:helmi/views/exchange_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
      ],
      child: MaterialApp(
        title: 'Crypto Wallet',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DashboardView(),
        routes: {
          '/home': (context) => DashboardView(),
          '/exchange': (context) => ExchangePage(),
        }
      ),
    );
  }
}