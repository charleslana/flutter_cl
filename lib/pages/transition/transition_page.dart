import 'package:flutter/material.dart';

class TransitionPage extends StatelessWidget {
  const TransitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transition title'),
        centerTitle: true,
      ),
      body: const Center(
        child: Icon(
          Icons.device_hub,
          size: 40,
        ),
      ),
    );
  }
}
