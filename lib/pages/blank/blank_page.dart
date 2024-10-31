import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blank title'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Blank page'),
      ),
    );
  }
}
