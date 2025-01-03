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
  language,
  pageview,
  floating,
  form,
  mock,
  game,
  gameDetail,
  count,
  signal,
  logout
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
      case AppRoute.language:
        return '/language';
      case AppRoute.pageview:
        return '/pageview';
      case AppRoute.floating:
        return '/floating';
      case AppRoute.form:
        return '/form';
      case AppRoute.mock:
        return '/mock';
      case AppRoute.game:
        return '/game';
      case AppRoute.gameDetail:
        return '/game-detail';
      case AppRoute.count:
        return '/count';
      case AppRoute.signal:
        return '/signal';
      case AppRoute.logout:
        return '/logout';
      default:
        return '';
    }
  }
}
