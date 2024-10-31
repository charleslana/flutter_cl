enum AppRoute {
  home,
  main,
  blank,
  login,
  fullscreen,
  detail,
  fade,
  scale,
  slide,
  rotation,
}

extension AppRouteExtension on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.home:
        return '/';
      case AppRoute.main:
        return '/main';
      case AppRoute.blank:
        return '/blank';
      case AppRoute.login:
        return '/login';
      case AppRoute.fullscreen:
        return '/fullscreen';
      case AppRoute.detail:
        return '/detail';
      case AppRoute.fade:
        return '/fade';
      case AppRoute.scale:
        return '/scale';
      case AppRoute.slide:
        return '/slide';
      case AppRoute.rotation:
        return '/rotation';
      default:
        return '';
    }
  }
}
