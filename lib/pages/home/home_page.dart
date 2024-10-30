import 'package:flutter/material.dart';
import 'package:flutter_cl/pages/home/home_controller.dart';
import 'package:flutter_cl/widgets/card_counter_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: controller.title,
          builder: (context, String title, _) => Text(
            title,
            key: const Key('title'),
          ),
        ),
        centerTitle: true,
      ),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.8,
              child: TextFormField(
                key: const Key('inputTitle'),
                initialValue: controller.title.value,
                onChanged: (valor) => controller.title.value = valor,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Titulo'),
                ),
              ),
            ),
            CardCounter(
              counter: controller.counter,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => controller.counter.value++,
        label: const Text('Incrementar'),
        icon: const Icon(Icons.plus_one),
      ),
    );
  }
}
