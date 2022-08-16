import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../my_george_game.dart';

class BakedGoodComponent extends SpriteComponent with GestureHitboxes, CollisionCallbacks, HasGameRef<MyGeorgeGame> {
  BakedGoodComponent() {
    debugMode = true;
    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    gameRef.bakedGoodsInventory++;
    // gameRef.yummy.start();
    // gameRef.overlays.notifyListeners();
    print('baked goods: ${gameRef.bakedGoodsInventory}');
    gameRef.remove(this);
  }
}