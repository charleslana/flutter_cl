import 'package:flutter/material.dart';
import 'package:flutter_cl/enum/app_route.dart';
import 'package:flutter_cl/models/detail.dart';
import 'package:flutter_cl/models/game.dart';
import 'package:flutter_cl/pages/blank/blank_page.dart';
import 'package:flutter_cl/pages/detail/detail_page.dart';
import 'package:flutter_cl/pages/floating/floating_page.dart';
import 'package:flutter_cl/pages/form/form_page.dart';
import 'package:flutter_cl/pages/fullscreen/fullscreen_page.dart';
import 'package:flutter_cl/pages/game/game_details_page.dart';
import 'package:flutter_cl/pages/game/game_page.dart';
import 'package:flutter_cl/pages/home/home_page.dart';
import 'package:flutter_cl/pages/language/language_page.dart';
import 'package:flutter_cl/pages/login/login_page.dart';
import 'package:flutter_cl/pages/main/main_page.dart';
import 'package:flutter_cl/pages/mock/mock_page.dart';
import 'package:flutter_cl/pages/pageview/pageview_page.dart';
import 'package:flutter_cl/pages/transition/transition_page.dart';
import 'package:flutter_cl/providers.dart';
import 'package:flutter_cl/services/auth_service.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(
      title: const Text('Not found page'),
      centerTitle: true,
    ),
    body: const Center(
      child: Text(
        'This my custom error page',
        textAlign: TextAlign.center,
      ),
    ),
  ),
  refreshListenable: getIt<AuthService>(),
  redirect: (context, state) {
    print('route: ${state.uri.path}');
    final isAuthenticated = getIt<AuthService>().isAuthenticated;
    final isLoginRoute = state.uri.path == AppRoute.login.path;
    if (!isAuthenticated) {
      return isLoginRoute ? null : AppRoute.login.path;
    }
    if (isLoginRoute) {
      return AppRoute.main.path;
    }
    return null;
  },
  initialLocation: AppRoute.main.path,
  routes: [
    GoRoute(
      path: AppRoute.home.path,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: AppRoute.main.path,
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: AppRoute.blank.path,
      builder: (context, state) => const BlankPage(),
    ),
    GoRoute(
      path: AppRoute.login.path,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoute.language.path,
      builder: (context, state) => const LanguagePage(),
    ),
    GoRoute(
      path: AppRoute.pageview.path,
      builder: (context, state) => const PageviewPage(),
    ),
    GoRoute(
      path: AppRoute.floating.path,
      builder: (context, state) => const FloatingPage(),
    ),
    GoRoute(
      path: AppRoute.form.path,
      builder: (context, state) => const FormPage(),
    ),
    GoRoute(
      path: AppRoute.mock.path,
      builder: (context, state) => const MockPage(),
    ),
    GoRoute(
      path: AppRoute.game.path,
      builder: (context, state) => const GamePage(),
    ),
    GoRoute(
      path: AppRoute.gameDetail.path,
      builder: (context, state) {
        final Game game = state.extra as Game;
        return GameDetailsPage(game: game);
      },
    ),
    GoRoute(
      path: AppRoute.fullscreen.path,
      pageBuilder: (context, state) => const MaterialPage(
        child: FullscreenPage(),
        fullscreenDialog: true,
      ),
    ),
    GoRoute(
      path: '${AppRoute.detail.path}/:detailId',
      builder: (context, state) {
        final detail = Detail(
          id: state.pathParameters['detailId'],
          name: 'Test',
          email: 'email@email.com',
        );
        return DetailPage(detail: detail);
      },
    ),
    GoRoute(
      path: AppRoute.fade.path,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const TransitionPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: AppRoute.scale.path,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const TransitionPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            ScaleTransition(scale: animation, child: child),
      ),
    ),
    GoRoute(
      path: AppRoute.slide.path,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const TransitionPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
                position: animation.drive(
                  Tween<Offset>(
                    begin: const Offset(0.25, 0.25),
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeIn)),
                ),
                child: child),
      ),
    ),
    GoRoute(
      path: AppRoute.rotation.path,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const TransitionPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            RotationTransition(turns: animation, child: child),
      ),
    ),
  ],
);
