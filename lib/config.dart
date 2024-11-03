import 'package:flutter/material.dart';
import 'package:flutter_cl/controllers/theme_controller.dart';
import 'package:get/get.dart';

Future<void> initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<ThemeController>(ThemeController.new);
}
