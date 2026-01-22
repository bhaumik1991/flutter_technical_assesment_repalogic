import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadGame extends GameEvent {}

class MakeMove extends GameEvent {
  final int index;
  MakeMove(this.index);

  @override
  List<Object?> get props => [index];
}

class ResetGame extends GameEvent {}

class ToggleMode extends GameEvent {}
