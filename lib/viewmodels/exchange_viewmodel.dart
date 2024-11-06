import 'package:flutter/material.dart';

class ExchangeViewModel {
  TextEditingController ethController = TextEditingController();
  TextEditingController usdController = TextEditingController();

  void swap() {
    // Implement logic to perform exchange
    print('Swapping ${ethController.text} ETH for USD');
  }
}