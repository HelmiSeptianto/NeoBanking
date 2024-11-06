import 'package:flutter/material.dart';
import '../viewmodels/exchange_viewmodel.dart';

class ExchangeView extends StatelessWidget {
  final ExchangeViewModel viewModel = ExchangeViewModel();

  ExchangeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exchange'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: viewModel.ethController,
              decoration: const InputDecoration(
                labelText: 'ETH',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: viewModel.usdController,
              decoration: const InputDecoration(
                labelText: 'USD',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: viewModel.swap,
              child: const Text('Swap'),
            ),
          ],
        ),
      ),
    );
  }
}