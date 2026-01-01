import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_vault/core/helpers/constants.dart';
import 'package:secret_vault/core/routing/app_routes.dart';

class AppLifecycleObserver with WidgetsBindingObserver {
  final GoRouter router;

  Timer? _lockTimer;

  static const int lockTimeoutSeconds = 30;

  DateTime? _pausedTime;

  AppLifecycleObserver(this.router);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log('AppLifecycleState changed to: $state');

    switch (state) {
      case AppLifecycleState.paused:
        _onAppPaused();
        break;

      case AppLifecycleState.resumed:
        _onAppResumed();
        break;

      case AppLifecycleState.detached:
        _onAppDetached();
        break;

      case AppLifecycleState.inactive:
        log('App inactive - no action');
        break;

      case AppLifecycleState.hidden:
        break;
    }
  }

  void _onAppPaused() {
    _pausedTime = DateTime.now();

    _lockTimer?.cancel();
    _lockTimer = Timer(
      const Duration(seconds: lockTimeoutSeconds),
      () {
        log('Lock timeout reached - clearing session');
        SessionKeys.clear();
      },
    );

    log('App paused - lock timer started ($lockTimeoutSeconds seconds)');
  }

  void _onAppResumed() {
    _lockTimer?.cancel();

    if (_pausedTime != null) {
      final pauseDuration = DateTime.now().difference(_pausedTime!);
      log('App resumed after ${pauseDuration.inSeconds} seconds');

      if (pauseDuration.inSeconds >= lockTimeoutSeconds) {
        SessionKeys.clear();
        log('Session cleared - exceeded timeout');
      }

      if (!SessionKeys.isUnlocked) {
        log('Navigating to lock screen');
        router.go(AppRoutes.lockScreen);
      } else {
        log('Session still active');
      }

      _pausedTime = null;
    }
  }

  void _onAppDetached() {
    _lockTimer?.cancel();
    SessionKeys.clear();
    log('App detached - session cleared');
  }

  void dispose() {
    _lockTimer?.cancel();
  }
}
