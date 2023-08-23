import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

import '../pages/comments_screen.dart';
import '../pages/login/login_screen.dart';
import '../pages/test_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: OnboardingRoute.page,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: CommentsRoute.page,
        ),
      ];
}
