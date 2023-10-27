import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

enum DinoState { idle, running }

class Dino extends FlameGame with KeyboardEvents {
  /// Player
  late SpriteComponent dinoSprite;
  late SpriteAnimationComponent dinoAnimation;

  late final SpriteAnimation idleAnimation;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    Sprite backgroundSprite = await loadSprite('Hills.png');
    var background = SpriteComponent()
      ..sprite = backgroundSprite
      ..size = backgroundSprite.originalSize;
    add(background);

    /// Player property
    double scale = 5.0;
    const double spriteWidth = 24;
    const double spriteHeight = 24;
    late SpriteAnimationComponent dino;

    dynamic dinoIdleImage = await Flame.images.load('DinoIdle.png');
    var dinoIdleAnimation = SpriteAnimation.fromFrameData(
        dinoIdleImage,
        SpriteAnimationData.sequenced(
            amount: 3,
            stepTime: 0.3,
            textureSize: Vector2(spriteWidth, spriteHeight)));
    dino = SpriteAnimationComponent()
      ..animation = dinoIdleAnimation
      ..size = Vector2(spriteWidth, spriteHeight) * scale
      ..position = Vector2(100, 140);

    add(dino);
    // add(dinoSprite);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;
    final isUp = keysPressed.contains(LogicalKeyboardKey.arrowUp);
    final isDown = keysPressed.contains(LogicalKeyboardKey.arrowDown);
    final isLeft = keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final isRight = keysPressed.contains(LogicalKeyboardKey.arrowRight);

    if (isKeyDown && isUp) {
      Up();
    } else if (isKeyDown && isDown) {
      Down();
    } else if (isKeyDown && isLeft) {
      Left();
    } else if (isKeyDown && isRight) {
      Right();
    } else {
      return KeyEventResult.ignored;
    }
    return KeyEventResult.handled;
  }

  void Up() {
    print("up");
  }

  void Down() {
    print("Down");
  }

  void Left() {
    print("Left");
  }

  void Right() {
    print("Right");
  }
}
