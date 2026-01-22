import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.initial()) {
    on<LoadGame>(_loadGame);
    on<MakeMove>(_makeMove);
    on<ResetGame>(_resetGame);
    on<ToggleMode>(_toggleMode);
  }

  void _loadGame(LoadGame event, Emitter<GameState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final board = prefs.getStringList('board') ?? state.board;
    emit(state.copyWith(board: board));
  }

  void _makeMove(MakeMove event, Emitter<GameState> emit) async {
    if (state.board[event.index].isNotEmpty || state.winner.isNotEmpty) return;

    final newBoard = List<String>.from(state.board);
    newBoard[event.index] = state.currentPlayer;

    final winner = _checkWinner(newBoard);
    emit(state.copyWith(
      board: newBoard,
      currentPlayer: state.currentPlayer == 'X' ? 'O' : 'X',
      winner: winner,
    ));

    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('board', newBoard);

    if (state.isVsComputer && state.currentPlayer == 'X' && winner.isEmpty) {
      _computerMove(emit);
    }
  }

  void _computerMove(Emitter<GameState> emit) {
    final emptyIndexes =
    state.board.asMap().entries.where((e) => e.value.isEmpty).map((e) => e.key).toList();

    if (emptyIndexes.isEmpty) return;

    final move = emptyIndexes[Random().nextInt(emptyIndexes.length)];
    add(MakeMove(move));
  }

  void _resetGame(ResetGame event, Emitter<GameState> emit) {
    emit(GameState.initial().copyWith(isVsComputer: state.isVsComputer));
  }

  void _toggleMode(ToggleMode event, Emitter<GameState> emit) {
    emit(state.copyWith(isVsComputer: !state.isVsComputer));
  }

  String _checkWinner(List<String> b) {
    const wins = [
      [0,1,2],[3,4,5],[6,7,8],
      [0,3,6],[1,4,7],[2,5,8],
      [0,4,8],[2,4,6],
    ];

    for (var w in wins) {
      if (b[w[0]].isNotEmpty &&
          b[w[0]] == b[w[1]] &&
          b[w[1]] == b[w[2]]) {
        return b[w[0]];
      }
    }
    return '';
  }
}
