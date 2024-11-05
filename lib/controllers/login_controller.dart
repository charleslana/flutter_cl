import 'package:flutter_cl/models/user_model.dart';
import 'package:signals/signals_flutter.dart';

class LoginController {
  final user = signal<UserModel?>(null);
  final loading = signal(false);

  late final isLoggedIn = computed(() => user() is UserModel);

  Future<void> login() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 3), () => null);
    user.value = UserModel(name: 'Charles', email: 'email@email.com');
    loading.value = false;
  }

  void logout() {
    user.value = null;
  }
}
