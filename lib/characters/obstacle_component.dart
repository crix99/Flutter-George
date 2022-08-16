import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:george/characters/george_component.dart';

import '../my_george_game.dart';

class ObstacleComponent extends PositionComponent with GestureHitboxes, CollisionCallbacks {
  final MyGeorgeGame game;
  bool hasCollided = false;
  ObstacleComponent({required this.game}) {
    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if(other is GeorgeComponent) {
      if(!hasCollided) {
        game.collisionDirection = game.direction;
        hasCollided = true;
        print('collde with obstacle: ${game.collisionDirection}');
      }
    }  
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    if(other is GeorgeComponent) {
      game.collisionDirection = -1;
      hasCollided = false;
    }
  }
}