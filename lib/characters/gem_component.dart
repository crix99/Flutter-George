import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../my_george_game.dart';
import 'george_component.dart';

class GemComponent extends SpriteComponent with GestureHitboxes, CollisionCallbacks {
  final MyGeorgeGame game;
  GemComponent({required this.game}) {
    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if(other is GeorgeComponent) {
      game.gemInventory++;
      print('Gems met');
    }

    game.remove(this);
    super.onCollision(intersectionPoints, other);
  }
}