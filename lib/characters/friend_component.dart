import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../my_george_game.dart';
import 'george_component.dart';

class FriendComponent extends PositionComponent with GestureHitboxes, CollisionCallbacks {
  final MyGeorgeGame game;
  FriendComponent({required this.game}) {
    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if(other is GeorgeComponent) {
      // var message = '';
      if(game.bakedGoodsInventory > 0 ) {
        game.dialogMessage = 'Wow. Thank you so much. Please come over '
          'this weekend for dinner. I have to go now. '
          'See you on Saturday at 7pm.';
        game.friendNumber++;
        game.bakedGoodsInventory--;
        print('friends met');
        // game.applause.start();
        // game.overlays.notifyListeners();

        if(game.maxFriend == game.friendNumber) {
          game.sceneNumber++;
          game.newScene();
        }
      } 
      else {
        game.dialogMessage = 'Great to meet you. Sorry I have to go now';
        print('no baked goods');
      }
      
      game.showDialog = true;
      // game.overlays.notifyListeners();
      // remove(this);
    }
      super.onCollision(intersectionPoints, other);
  }
}