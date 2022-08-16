import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george/characters/baked_good_component.dart';
import 'package:tiled/tiled.dart';

import '../my_george_game.dart';

void addBakedGoods(TiledComponent homeMap, MyGeorgeGame game) async {
  final bakedGoodsGroup = homeMap.tileMap.getLayer<ObjectGroup>('BakedGoods');

  for(var bakedGood in bakedGoodsGroup!.objects) {
    switch(bakedGood.type) {
      case 'ApplePie':
      var applePie = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..sprite = await game.loadSprite('apple_pie.png')
          ..debugMode = true;
        game.componentList.add(applePie);
        game.add(applePie);
        break;

      case 'Cookie':
        var cookie = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..sprite = await game.loadSprite('cookies.png')
          ..debugMode = true;
        game.componentList.add(cookie);
        game.add(cookie);
        break;

      case 'CheeseCake':
        var cheeseCake = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..sprite = await game.loadSprite('cheesecake.png')
          ..debugMode = true;
        game.componentList.add(cheeseCake);
        game.add(cheeseCake);
        break;

      case 'ChocoCake':
        var chocoCake = BakedGoodComponent()
          ..position = Vector2(bakedGood.x, bakedGood.y)
          ..width = bakedGood.width
          ..height = bakedGood.height
          ..sprite = await game.loadSprite('choco_cake.png')
          ..debugMode = true;
        game.componentList.add(chocoCake);
        game.add(chocoCake);
        break;
    }   
  }
}