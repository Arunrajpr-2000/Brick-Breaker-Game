import 'package:brick_breaker_game_app/src/brick_breaker.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  final game = BrickBreaker();
  runApp(GameWidget(game: game));
}
