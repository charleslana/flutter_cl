// import 'package:flutter/material.dart';
// import 'package:flutter_cl/enum/app_route.dart';
// import 'package:flutter_cl/models/game.dart';
// import 'package:flutter_cl/services/mock_service.dart';
// import 'package:go_router/go_router.dart';

// class MockPage extends StatelessWidget {
//   const MockPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final MockService mockService = MockService();

//     return Scaffold(
//       appBar: AppBar(title: const Text('Carregar JSON')),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () => context.push(AppRoute.game.path),
//                     child: const Text('Botão 1'),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text('Botão 2'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder<List<Game>>(
//               future: mockService.loadGames(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Erro: ${snapshot.error}'));
//                 } else if (snapshot.hasData) {
//                   // return SingleChildScrollView(
//                   //   child: Center(child: Text('JSON carregado: ${snapshot.data}')),
//                   // );
//                   final List<Game> games = snapshot.data!;
//                   return ListView.builder(
//                     itemCount: games.length,
//                     itemBuilder: (context, index) {
//                       final Game game = games[index];
//                       return Card(
//                         margin: const EdgeInsets.all(8),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Nome: ${game.name}',
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text('Ano: ${game.year}'),
//                               Text('Descrição: ${game.description}'),
//                               Text('Gêneros: ${game.genre.join(", ")}'),
//                               Text(
//                                   'Avaliação dos Membros: ${game.ratingMember}'),
//                               Text(
//                                   'Avaliação da Crítica: ${game.ratingCritic}'),
//                               const SizedBox(height: 8),
//                               Image.network(game.image),
//                               // Image.asset(game.image),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 } else {
//                   return const Center(child: Text('Nenhum dado encontrado.'));
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_cl/enum/app_route.dart';
import 'package:flutter_cl/models/game.dart';
import 'package:flutter_cl/services/mock_service.dart';
import 'package:go_router/go_router.dart';

class MockPage extends StatelessWidget {
  const MockPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MockService mockService = MockService();

    return Scaffold(
      appBar: AppBar(title: const Text('Carregar JSON')),
      body: FutureBuilder<List<Game>>(
        future: mockService.loadGames(),
        builder: (context, snapshot) {
          final bool isLoading =
              snapshot.connectionState == ConnectionState.waiting;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () => context.push(AppRoute.game.path),
                        child: const Text('Botão 1'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: isLoading ? null : () {},
                        child: const Text('Botão 2'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: snapshot.connectionState == ConnectionState.waiting
                    ? const Center(child: CircularProgressIndicator())
                    : snapshot.hasError
                        ? Center(child: Text('Erro: ${snapshot.error}'))
                        : snapshot.hasData
                            ? ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  final Game game = snapshot.data![index];
                                  return Card(
                                    margin: const EdgeInsets.all(8),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Nome: ${game.name}',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text('Ano: ${game.year}'),
                                          Text(
                                              'Descrição: ${game.description}'),
                                          Text(
                                              'Gêneros: ${game.genre.join(", ")}'),
                                          Text(
                                              'Avaliação dos Membros: ${game.ratingMember}'),
                                          Text(
                                              'Avaliação da Crítica: ${game.ratingCritic}'),
                                          const SizedBox(height: 8),
                                          Image.network(game.image),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const Center(
                                child: Text('Nenhum dado encontrado.')),
              ),
            ],
          );
        },
      ),
    );
  }
}
