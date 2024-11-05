import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class CountPage extends StatelessWidget {
  CountPage({super.key});

  final counter = signal(0);
  final error = signal<String?>(null);

  late final doubleCounter = computed(() => counter() * 2);
  late final isEnable = computed(() => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador com Signal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você apertou o botão esta quantidade de vezes:'),
            Text(
              '${counter.watch(context)}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text('double counter:'),
            Text(
              '${doubleCounter.watch(context)}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Spacer(),
            Flexible(
              flex: 5,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 60,
                child: FilledButton(
                  onPressed:
                      isEnable.watch(context) && doubleCounter.value == 10
                          ? () {}
                          : null,
                  child: const Text('Botão'),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
