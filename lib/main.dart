import 'package:flutter/material.dart';
import 'package:flutter_cl/my_app.dart';
import 'package:flutter_cl/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}
