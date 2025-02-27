import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  final Function(double, bool) onTransaction;

  const TransactionsPage({super.key, required this.onTransaction});

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final TextEditingController _amountController = TextEditingController();
  bool _isIncome = true;

  void _submitTransaction() {
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) return;

    widget.onTransaction(amount, _isIncome);
    _amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Type: '),
                DropdownButton<bool>(
                  value: _isIncome,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _isIncome = value);
                    }
                  },
                  items: const [
                    DropdownMenuItem(value: true, child: Text('Income')),
                    DropdownMenuItem(value: false, child: Text('Expense')),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitTransaction,
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
