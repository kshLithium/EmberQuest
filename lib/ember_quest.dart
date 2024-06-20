import 'package:ember_quest/actors/ember.dart';
import 'package:ember_quest/objects/ground_block.dart';
import 'package:ember_quest/objects/platform_block.dart';
import 'package:ember_quest/objects/star.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'managers/segment_manager.dart';
import 'actors/water_enemy.dart';

class EmberQuestGame extends FlameGame {
  late EmberPlayer _ember;
  double objectSpeed = 0.0;

  void loadGameSegments(int segmentIndex, double xPositionOffset) {
    for (final block in segments[segmentIndex]) {
      switch (block.blockType) {
        case GroundBlock:
        case PlatformBlock:
        case Star:
        case WaterEnemy:
      }
    }
  }

  void initializeGame() {
    //Assume that size.x < 3200
    final segmentsToLoad = (size.x / 640).ceil();
    segmentsToLoad.clamp(0, segments.length);

    for (var i = 0; i <= segmentsToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }

    _ember = EmberPlayer(
      position: Vector2(128, canvasSize.y - 70),
    );

    world.add(_ember);
  }

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
    initializeGame();
  }
}
