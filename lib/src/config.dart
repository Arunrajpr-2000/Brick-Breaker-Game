import 'package:flutter/material.dart';

const brickColor = [
  Color(0xfff94144),
  Color(0xfff3722c),
  Color(0xfff8961e),
  Color(0xfff9844a),
  Color(0xfff9c74f),
  Color(0xff90be6d),
  Color(0xff43aa8b),
  Color(0xff4d908e),
  Color(0xff277da1),
  Color(0xff577590),
];

const gameHeight = 720.0;
const gameWidth = 320.0;
const ballRadius = gameWidth * 0.02;
const batHeight = ballRadius * 2;
const batWidth = gameWidth * 0.2;
const batStep = gameWidth * 0.05;
const brickGutter = gameWidth * 0.015;

final brickWidth =
    (gameWidth - (brickGutter * (brickColor.length - 1))) / brickColor.length;

const brickHeight = gameHeight * 0.03;

const difficultyModifier = 1.03;
