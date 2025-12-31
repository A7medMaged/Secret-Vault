import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_vault/core/helpers/extensions.dart';
import 'package:secret_vault/core/routing/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push(AppRoutes.settingsScreen);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 24.sp),
        ),
      ),
    );
  }
}
