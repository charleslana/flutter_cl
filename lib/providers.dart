import 'package:flutter_cl/services/auth_service.dart';
import 'package:flutter_cl/services/translation_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupProviders() {
  getIt.registerSingleton<TranslationService>(TranslationService());
  getIt.registerSingleton<AuthService>(AuthService());
}
