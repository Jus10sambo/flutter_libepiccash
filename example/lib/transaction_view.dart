import 'package:flutter/material.dart';
import 'package:flutter_libepiccash/lib.dart';
import 'package:flutter_libepiccash/models/transaction.dart';

class TransactionView extends StatelessWidget {
  final String walletName;
  final String password;

  TransactionView({Key? key, required this.walletName, required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet Transactions'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder<List<Transaction>>(
        future:
            LibEpiccash.getTransactions(wallet: walletName, refreshFromNode: 1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final transactions = snapshot.data!;
          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return ListTile(
                title: Text('Transaction ID: ${transaction.id}'),
                subtitle: Text('Amount: ${transaction.amountCredited}'),
              );
            },
          );
        },
      ),
    );
  }
}
