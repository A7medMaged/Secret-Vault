import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_vault/core/helpers/constants.dart';
import 'package:secret_vault/core/helpers/secure_storage_helper.dart';
import 'package:secret_vault/core/routing/app_routes.dart';
import 'package:secret_vault/features/home/presentation/home_screen.dart';
import 'package:secret_vault/features/lock/logic/pin_cubit/pin_cubit.dart';
import 'package:secret_vault/features/lock/presentation/create_pin_screen.dart';
import 'package:secret_vault/features/lock/presentation/lock_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.lockScreen,
    redirect: (context, state) async {
      final pin = await SecureStorageHelper.getSecuredString(
        SecureStorageKeys.pinKey,
      );

      final hasPin = pin.isNotEmpty;

      final isOnCreatePin = state.matchedLocation == AppRoutes.createPinScreen;
      final isOnLock = state.matchedLocation == AppRoutes.lockScreen;

      if (!hasPin && !isOnCreatePin) return AppRoutes.createPinScreen;

      if (hasPin && !isOnLock && state.matchedLocation == '/') {
        return AppRoutes.lockScreen;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.createPinScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => PinCubit(),
          child: const CreatePinScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.lockScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => PinCubit(),
          child: const LockScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
