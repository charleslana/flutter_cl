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
              child: Text(
                'Floating page',
                style: TextStyle(color: Colors.white),
              ),
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
                      heroTag: 'star1',
                      onPressed: () {},
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star),
                          SizedBox(height: 4),
                          FittedBox(
                            child: Text(
                              'Star',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    FloatingActionButton(
                      heroTag: 'star2',
                      onPressed: () {},
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star),
                          SizedBox(height: 4),
                          FittedBox(
                            child: Text(
                              'Favorite',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    FloatingActionButton(
                      heroTag: 'starBorder1',
                      onPressed: () {},
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star_border),
                          SizedBox(height: 4),
                          FittedBox(
                            child: Text(
                              'Star Border',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    FloatingActionButton(
                      heroTag: 'starBorder2',
                      onPressed: () {},
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star_border),
                          SizedBox(height: 4),
                          FittedBox(
                            child: Text(
                              'Big Star Border',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
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
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.favorite),
                      SizedBox(height: 4),
                      FittedBox(
                        child: Text(
                          'Favorite',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'favorite2',
                  onPressed: () {},
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.favorite),
                      SizedBox(height: 4),
                      FittedBox(
                        child: Text(
                          'Like',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
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
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(height: 4),
                      FittedBox(
                        child: Text(
                          'Back',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'arrowBack2',
                  onPressed: () {},
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(height: 4),
                      FittedBox(
                        child: Text(
                          'Back',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
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
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_forward),
                      SizedBox(height: 4),
                      FittedBox(
                        child: Text(
                          'Forward',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'arrowForward2',
                  onPressed: () {},
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_forward),
                      SizedBox(height: 4),
                      FittedBox(
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
