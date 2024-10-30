import 'package:flutter/material.dart';
import 'package:flutter_cl/pages/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste de Integração',
      home: HomePage(),
    );
  }
}
