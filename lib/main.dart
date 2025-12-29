import 'package:flutter/material.dart';

void main() {
  runApp(const SecretVault());
}

class SecretVault extends StatelessWidget {
  const SecretVault({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Secret Vault',
      home: Scaffold(
        body: Center(
          child: Text('Secret Vault'),
        ),
      ),
    );
  }
}
