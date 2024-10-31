import 'package:flutter/material.dart';

class FullscreenPage extends StatelessWidget {
  const FullscreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fullscreen title'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Fullscreen page'),
      ),
    );
  }
}
