import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:tiled/tiled.dart';

import '../characters/gem_component.dart';
import '../my_george_game.dart';

void loadGems(TiledComponent homeMap, MyGeorgeGame game) async {

  final gemGroup = homeMap.tileMap.getLayer<ObjectGroup>('gems');

      for(var gemBox in gemGroup!.objects) {
        var gem = GemComponent(game: game)
          ..sprite = await game.loadSprite('CutRuby.png')
          ..position = Vector2(gemBox.x, gemBox.y - gemBox.height)
          ..width = gemBox.width
          ..height = gemBox.height
          ..debugMode = true;
         game.componentList.add(gem);
         game.add(gem);
      }         
}