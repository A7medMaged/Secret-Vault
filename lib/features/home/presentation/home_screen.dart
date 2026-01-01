import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_vault/core/routing/app_routes.dart';
import 'package:secret_vault/core/theming/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Home',
          style: TextStyles.font24mainBold,
        ),
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
          style: TextStyles.font24Regular,
        ),
      ),
    );
  }
}
