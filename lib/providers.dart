import 'package:flutter_cl/routes.dart';
import 'package:flutter_cl/services/auth_service.dart';
import 'package:flutter_cl/services/translation_service.dart';
import 'package:provider/provider.dart';

var providers = [
  ChangeNotifierProvider<AuthService>.value(value: authService),
  ChangeNotifierProvider(create: (_) => TranslationService()),
];
