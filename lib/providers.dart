import 'package:flutter_cl/repositories/game_repository.dart';
import 'package:flutter_cl/services/auth_service.dart';
import 'package:flutter_cl/services/theme_service.dart';
import 'package:flutter_cl/services/translation_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupProviders() {
  getIt
    ..registerSingleton<TranslationService>(TranslationService())
    ..registerSingleton<AuthService>(AuthService())
    ..registerSingleton<GameRepository>(GameRepository())
    ..registerLazySingleton<ThemeService>(ThemeService.new);
}
