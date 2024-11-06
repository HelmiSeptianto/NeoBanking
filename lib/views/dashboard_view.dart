// views/dashboard_view.dart
import 'package:flutter/material.dart';
import 'package:helmi/viewmodels/dashboard_viewmodel.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedMenuIndex = 0;
  int _selectedTabIndex = 0;
  final List<String> _menus = ["Crypto", "Fiat", "Card", "Saving"];

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("NEO BANKING"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<DashboardViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profil User dan Saldo Total (di sebelah kiri)
                Row(
                  children: [
                    CircleAvatar(
                      // backgroundImage: NetworkImage(viewModel.user.avatarUrl),
                      backgroundImage: AssetImage('assets/avatar.jpg'),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.user.name,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          "Total Balance",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "\$${viewModel.totalBalance.amount.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Tombol Aksi dengan Ikon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildActionButton(Icons.savings, "Add Saving", (){}),
                    _buildActionButton(Icons.arrow_upward, "Withdraw",  (){}),
                    _buildActionButton(Icons.arrow_downward, "Top Up",  (){}),
                    _buildActionButton(Icons.swap_horiz, "Exchange", () {
                      Navigator.pushNamed(context, '/exchange');
                    }),
                  ],
                ),
                SizedBox(height: 20),

                // Menu Crypto, Fiat, Card, Saving
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(_menus.length, (index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedMenuIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        decoration: BoxDecoration(
                          color: _selectedMenuIndex == index ? Colors.blueAccent : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _menus[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _selectedMenuIndex == index ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 20),

                // Crypto Balances Section
                Text("Crypto Balances", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: viewModel.currencies.map((currency) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                // Ikon dengan latar belakang warna untuk aset
                                CircleAvatar(
                                  backgroundColor: currency.symbol == 'BTC' ? Colors.orangeAccent : Colors.purpleAccent,
                                  child: Icon(
                                    currency.symbol == 'BTC' ? Icons.currency_bitcoin : Icons.account_balance_wallet,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                // Nama aset
                                Text(
                                  currency.symbol,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Jumlah aset
                            Text(
                              currency.balance.toStringAsFixed(4),
                              style: const TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            // Harga aset dalam USD
                            Text(
                              "\$${currency.priceUSD.toStringAsFixed(2)}",
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),

                // Recent Transactions Section
                Text("Recent Transactions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = viewModel.transactions[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            child: Icon(Icons.swap_horiz, color: Colors.white),
                          ),
                          title: Text(
                            transaction.type,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          subtitle: Text(transaction.date, style: TextStyle(color: Colors.grey)),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "+${transaction.amount} ${transaction.currency}",
                                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "\$${transaction.convertedAmount.toStringAsFixed(2)}",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedTabIndex,
        onTap: _onTabSelected,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Accounts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.savings),
            label: 'Savings',
          ),
        ],
      ),
    );
  }

  // Widget helper untuk tombol aksi dengan ikon dan label
  Widget _buildActionButton(IconData icon, String label, VoidCallback onTap) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.blueAccent),
            onPressed: onTap, // Pastikan ini memanggil onTap yang diberikan
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
