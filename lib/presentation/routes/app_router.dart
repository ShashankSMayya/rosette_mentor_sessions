import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

import '../pages/comments_screen.dart';
import '../pages/login/login_screen.dart';
import '../pages/movie/movie_screen.dart';
import '../pages/onboarding/onboarding_screen.dart';
import '../pages/wavy_test_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnboardingRoute.page,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: CommentsRoute.page,
        ),
        AutoRoute(
          page: WavyTestRoute.page,
        ),
        AutoRoute(
          page: MovieRoute.page,
          initial: true,
        )
      ];
}
