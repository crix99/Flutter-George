import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_tiled/flame_tiled.dart';

import 'characters/george_component.dart';
import 'loaders/add_baked_goods.dart';
import 'loaders/load_friends.dart';
import 'loaders/load_gems.dart';
import 'loaders/load_obstacles.dart';

class MyGeorgeGame extends FlameGame with TapDetector, HasCollisionDetection, HasGameRef {
  
  late GeorgeComponent george;
  late TiledComponent homeMap;
  late AudioPool yummy, applause;
  late double mapWidth;
  late double mapHeight;

  int direction = 0;
  int collisionDirection = -1; //no collision
  int friendNumber = 0;
  int maxFriend = 0;
  int sceneNumber = 1;
  int bakedGoodsInventory = 0;
  int gemInventory = 0;
  
  final double characterSize = 60;
  final double characterSpeed = 100;

  List<Component> componentList = [];

  String dialogMessage = 'Hi. I am George. I have just '
    'moved here. I wanna make friends. ';

  bool showDialog = true;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    homeMap = await TiledComponent.load('map.tmx', Vector2.all(16));
    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 16.0;
    mapHeight = homeMap.tileMap.map.height * 16.0;

    // load characters and players
    addBakedGoods(homeMap, this);
    loadFriends(homeMap, this);
    loadObstacles(homeMap, this);

    if(sceneNumber == 4) {
      loadGems(homeMap, this);
    }

    // yummy = await AudioPool.create('yummy.mp3', maxPlayers: 2);
    // applause = await AudioPool.create('applause.mp3', maxPlayers: 1);

    FlameAudio.bgm.initialize();
    FlameAudio.audioCache.load('music.mp3');
    // FlameAudio.bgm.play('music.mp3');
    overlays.add('ButtonController');

    george = GeorgeComponent(game: this)
      ..position = Vector2(700, 400)
      ..debugMode = true
      ..size = Vector2.all(characterSize);

    add(george);

    camera.followComponent(george, worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void onTapUp(TapUpInfo info) {
    direction += 1;
    if(direction > 4) {
      direction = 0;
    }
  }

  void newScene() async {
    String mapFile = 'happy_map.tmx';
    print('to new scene');

    //remove old scene
    remove(homeMap);
    bakedGoodsInventory = 0;
    friendNumber = 0;
    maxFriend = 0;
    FlameAudio.bgm.stop();
    removeAll(componentList);
    componentList = [];
    showDialog = false;
    remove(george);
    george = GeorgeComponent(game: this)
      ..position = Vector2(300, 128)
      ..debugMode = true
      ..size = Vector2.all(characterSize);
    
    if(sceneNumber == 2) {
      print('moving to map2');
      // mapFile = 'happy_map.tmx';
    }
    else if(sceneNumber == 3) {
      print('moving to scene3');
      mapFile = 'scene3.tmx';
    }
    else if(sceneNumber == 4) {
      print('moving to scene4');
      mapFile = 'scene4.tmx';
    }

    homeMap = await TiledComponent.load(mapFile, Vector2.all(16));
    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 16;
    mapHeight = homeMap.tileMap.map.height * 16;
    addBakedGoods(homeMap, this);
    loadFriends(homeMap, this);
    loadObstacles(homeMap, this);
    add(george);
    camera.followComponent(george, worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }
  
}