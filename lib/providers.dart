import 'package:flutter_cl/routes.dart';
import 'package:flutter_cl/services/auth_service.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider<AuthService>.value(value: authService),
];
