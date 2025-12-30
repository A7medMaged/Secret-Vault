import 'package:go_router/go_router.dart';
import 'package:secret_vault/core/routing/app_routes.dart';
import 'package:secret_vault/features/home/presentation/home_screen.dart';
import 'package:secret_vault/features/lock/presentation/create_pin_screen.dart';
import 'package:secret_vault/features/lock/presentation/lock_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.createPinScreen,
    routes: [
      GoRoute(
        path: AppRoutes.createPinScreen,
        builder: (context, state) => const CreatePinScreen(),
      ),
      GoRoute(
        path: AppRoutes.lockScreen,
        builder: (context, state) => const LockScreen(),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
