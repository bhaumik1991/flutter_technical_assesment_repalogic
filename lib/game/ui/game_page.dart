import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_assesment_repalogic/game/bloc/game_bloc.dart';
import 'package:flutter_technical_assesment_repalogic/game/bloc/game_event.dart';
import 'package:flutter_technical_assesment_repalogic/game/bloc/game_state.dart';


class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: BlocBuilder<GameBloc, GameState>(
            builder: (context, state) {
              return Column(
                children: [
                  _header(context, state),
                  _statusCard(context, state),
                  _gameBoard(context, state),
                  _bottomActions(context),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context, GameState state) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Tic Tac Toe',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () => context.read<GameBloc>().add(ResetGame()),
          ),
        ],
      ),
    );
  }

  Widget _statusCard(BuildContext context, GameState state) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            state.winner.isEmpty
                ? 'Player ${state.currentPlayer} Turn'
                : '🎉 Winner: ${state.winner}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          SwitchListTile.adaptive(
            title: const Text(
              'Play vs Computer',
              style: TextStyle(color: Colors.white),
            ),
            value: state.isVsComputer,
            onChanged: (_) {
              context.read<GameBloc>().add(ToggleMode());
            },
          ),

        ],
      ),
    );
  }

  Widget _gameBoard(BuildContext context, GameState state) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (_, index) {
            final value = state.board[index];
            return GestureDetector(
              onTap: () =>
                  context.read<GameBloc>().add(MakeMove(index)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(4, 6),
                    )
                  ],
                ),
                child: Center(
                  child: AnimatedScale(
                    scale: value.isEmpty ? 0.8 : 1.2,
                    duration: const Duration(milliseconds: 200),
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: value == 'X'
                            ? Colors.amber
                            : Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _bottomActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton.icon(
        onPressed: () =>
            context.read<GameBloc>().add(ResetGame()),
        icon: const Icon(Icons.restart_alt),
        label: const Text('Restart Game'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.black.withOpacity(0.3),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
