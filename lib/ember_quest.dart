import 'package:flame/game.dart';
import 'package:flame/components.dart';

class EmberQuestGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'block.png',
      'ember.png',
      'ground.png',
      'heart_half.png',
      'heart.png',
      'star.png',
      'water_enemy.png'
    ]);

    camera.viewfinder.anchor = Anchor.topLeft;
  }
}
