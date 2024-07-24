import 'dart:async';
import 'package:brick_breaker_game_app/src/components/ball.dart';
import 'package:brick_breaker_game_app/src/components/bat.dart';
import 'package:brick_breaker_game_app/src/components/brick.dart';
import 'package:brick_breaker_game_app/src/components/play_area.dart';
import 'package:brick_breaker_game_app/src/config.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrickBreaker extends FlameGame
    with HasCollisionDetection, KeyboardEvents {
  BrickBreaker()
      : super(
            camera: CameraComponent.withFixedResolution(
                width: gameWidth, height: gameHeight));

  final rand = math.Random();
  double get width => size.x;
  double get height => size.y;

  @override
  FutureOr<void> load() async {
    // ignore: invalid_use_of_internal_member
    super.load();

    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(PlayArea());
    world.add(
      Ball(
          velocity:
              Vector2((rand.nextDouble() - 0.5) * width, height).normalized()
                ..scale(height / 5),
          position: size / 2,
          radius: ballRadius,
          difficultyModifier: difficultyModifier),
    );

    world.add(
      Bat(
        cornerRadius: const Radius.circular(ballRadius / 2),
        position: Vector2(width / 2, height * 0.95),
        size: Vector2(batWidth, batHeight),
      ),
    );

    await world.addAll([
      for (var i = 0; i < brickColor.length; i++)
        for (var j = 0; j <= 5; j++)
          Brick(
            position: Vector2((i + 0.5) * brickWidth + (i + 1) * brickGutter,
                (j + 2.0) * brickHeight + j * brickGutter),
            color: brickColor[i],
          )
    ]);
    debugMode = true;
  }

  @override
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    super.onKeyEvent(event, keysPressed);

    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowLeft:
        world.children.query<Bat>().first.moveBy(-batStep);
      case LogicalKeyboardKey.arrowRight:
        world.children.query<Bat>().first.moveBy(batStep);
    }
    return KeyEventResult.handled;
  }
}
