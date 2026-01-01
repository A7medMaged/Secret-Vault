import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_vault/core/helpers/constants.dart';
import 'package:secret_vault/core/routing/app_routes.dart';

class AppLifecycleObserver with WidgetsBindingObserver {
  final GoRouter router;

  AppLifecycleObserver(this.router);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      SessionKeys.clear();
    }

    if (state == AppLifecycleState.resumed) {
      if (!SessionKeys.isUnlocked) {
        router.go(AppRoutes.lockScreen);
      }
    }

    log('🟢 AppLifecycleState changed to: $state');
  }
}
