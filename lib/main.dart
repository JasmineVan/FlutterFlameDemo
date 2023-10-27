import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'models/Dino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  runApp(GameWidget(game: Dino()));
}


