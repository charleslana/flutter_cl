import 'package:flutter/material.dart';
import 'package:flutter_cl/entities/game.dart';
import 'package:flutter_cl/services/mock_service.dart';

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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // return SingleChildScrollView(
            //   child: Center(child: Text('JSON carregado: ${snapshot.data}')),
            // );
            final List<Game> games = snapshot.data!;
            return ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                final Game game = games[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nome: ${game.name}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Ano: ${game.year}'),
                        Text('Descrição: ${game.description}'),
                        Text('Gêneros: ${game.genre.join(", ")}'),
                        Text('Avaliação dos Membros: ${game.ratingMember}'),
                        Text('Avaliação da Crítica: ${game.ratingCritic}'),
                        const SizedBox(height: 8),
                        Image.network(game.image),
                        // Image.asset(game.image),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Nenhum dado encontrado.'));
          }
        },
      ),
    );
  }
}
