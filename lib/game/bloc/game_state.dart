import 'package:equatable/equatable.dart';

class GameState extends Equatable {
  final List<String> board;
  final String currentPlayer;
  final String winner;
  final bool isVsComputer;

  const GameState({
    required this.board,
    required this.currentPlayer,
    required this.winner,
    required this.isVsComputer,
  });

  factory GameState.initial() => const GameState(
    board: ['', '', '', '', '', '', '', '', ''],
    currentPlayer: 'X',
    winner: '',
    isVsComputer: false,
  );

  GameState copyWith({
    List<String>? board,
    String? currentPlayer,
    String? winner,
    bool? isVsComputer,
  }) {
    return GameState(
      board: board ?? this.board,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      winner: winner ?? this.winner,
      isVsComputer: isVsComputer ?? this.isVsComputer,
    );
  }

  @override
  List<Object?> get props => [board, currentPlayer, winner, isVsComputer];
}
