import 'package:flutter/material.dart';

class CardCounter extends StatelessWidget {
  const CardCounter({super.key, required this.counter});

  final ValueNotifier<int> counter; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Card(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Contador'),
              ValueListenableBuilder(
                valueListenable: counter,
                builder: (context, int counter, _) => Text(
                  counter.toString(),
                  style: const TextStyle(fontSize: 45),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
