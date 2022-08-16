import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:tiled/tiled.dart';

import '../characters/friend_component.dart';
import '../my_george_game.dart';

void loadFriends(TiledComponent homeMap, MyGeorgeGame game) {

  final friendGroup = homeMap.tileMap.getLayer<ObjectGroup>('Friends');

      for(var friendBox in friendGroup!.objects) {
        var friend = FriendComponent(game: game)
          ..position = Vector2(friendBox.x, friendBox.y)
          ..width = friendBox.width
          ..height = friendBox.height
          ..debugMode = true;
         game.maxFriend++;
         game.componentList.add(friend);
         game.add(friend);
      }         
}