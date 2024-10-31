import 'package:flutter/material.dart';
import 'package:flutter_cl/entities/detail.dart';
import 'package:flutter_cl/enum/app_route.dart';
import 'package:flutter_cl/pages/blank/blank_page.dart';
import 'package:flutter_cl/pages/detail/detail_page.dart';
import 'package:flutter_cl/pages/fullscreen/fullscreen_page.dart';
import 'package:flutter_cl/pages/home/home_page.dart';
import 'package:flutter_cl/pages/login/login_page.dart';
import 'package:flutter_cl/pages/main/main_page.dart';
import 'package:flutter_cl/pages/transition/transition_page.dart';
import 'package:flutter_cl/services/auth_service.dart';
import 'package:go_router/go_router.dart';

final authService = AuthService();

final GoRouter routes = GoRouter(
  errorBuilder: ((context, state) => Scaffold(
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
      )),
  refreshListenable: authService,
  redirect: (context, state) {
    print('route: ${state.uri.path}');
    final isAuthenticated = authService.isAuthenticated;
    final isLoginRoute = state.uri.path == AppRoute.login.path;
    if (!isAuthenticated) {
      return isLoginRoute ? null : AppRoute.login.path;
    }
    if (isLoginRoute) return AppRoute.main.path;
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