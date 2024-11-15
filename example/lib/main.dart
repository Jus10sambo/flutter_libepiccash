import 'package:flutter/material.dart';

import 'init_transaction_view.dart';
import 'mnemonic_view.dart';
import 'transaction_view.dart';
import 'wallet_name.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Epic Wallet',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flutter_libepiccash/example')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const WalletNameView(recover: false)),
                );
              },
              child: const Text('Create Wallet'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const WalletNameView(recover: true)),
                );
              },
              child: const Text('Recover Wallet'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MnemonicView(
                      name: 'example',
                      password: 'password123',
                    ),
                  ),
                );
              },
              child: const Text('Show Mnemonic'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionView(
                      password: 'password123',
                    ),
                  ),
                );
              },
              child: const Text('View Transactions'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InitTransactionView(
                      password: 'password123',
                    ),
                  ),
                );
              },
              child: const Text('Initiate Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
