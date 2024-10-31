import 'package:flutter/material.dart';

class FloatingPage extends StatelessWidget {
  const FloatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating title'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black87,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: Text('Floating page'),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Row(
              children: [
                Column(
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.star),
                    ),
                    const SizedBox(height: 10),
                    FloatingActionButton(
                      heroTag: 'star1',
                      onPressed: () {},
                      child: const Icon(Icons.star),
                    ),
                    const SizedBox(height: 10),
                    FloatingActionButton(
                      heroTag: 'star2',
                      onPressed: () {},
                      child: const Icon(Icons.star),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    FloatingActionButton(
                      heroTag: 'star3',
                      onPressed: () {},
                      child: const Icon(Icons.star_border),
                    ),
                    const SizedBox(height: 10),
                    FloatingActionButton(
                      heroTag: 'star4',
                      onPressed: () {},
                      child: const Icon(Icons.star_border),
                    ),
                    const SizedBox(height: 10),
                    FloatingActionButton(
                      heroTag: 'star5',
                      onPressed: () {},
                      child: const Icon(Icons.star_border),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: 'favorite1',
                  onPressed: () {},
                  child: const Icon(Icons.favorite),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'favorite2',
                  onPressed: () {},
                  child: const Icon(Icons.favorite),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'favorite3',
                  onPressed: () {},
                  child: const Icon(Icons.favorite),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: 'arrowBack1',
                  onPressed: () {},
                  child: const Icon(Icons.arrow_back),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'arrowBack2',
                  onPressed: () {},
                  child: const Icon(Icons.arrow_back),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'arrowBack3',
                  onPressed: () {},
                  child: const Icon(Icons.arrow_back),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: 'arrowForward1',
                  onPressed: () {},
                  child: const Icon(Icons.arrow_forward),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'arrowForward2',
                  onPressed: () {},
                  child: const Icon(Icons.arrow_forward),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'arrowForward3',
                  onPressed: () {},
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
