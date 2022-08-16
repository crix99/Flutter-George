import 'package:flutter/material.dart';
import '../my_george_game.dart';

class ScoreOverlay extends StatelessWidget {
  const ScoreOverlay({
    Key? key,
    required this.game,
  }) : super(key: key);

  final MyGeorgeGame game;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: const Color.fromARGB(167, 218, 218, 218), //background color
          child: Image.asset(
            'assets/images/friend.png', 
            scale: .7,),
        ),
        const SizedBox(
          width: 12,),
        Container(
          color: const Color.fromARGB(167, 218, 218, 218), 
          child: Text(
            '${game.friendNumber}',
            style: TextStyle(fontSize: 25, color: Colors.black45)),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          color: const Color.fromARGB(167, 218, 218, 218), //background color
          child: Image.asset(
            'assets/images/choco_cake.png', 
            scale: 1,),
        ),
        const SizedBox(
          width: 12,),
        Container(
          color: const Color.fromARGB(167, 218, 218, 218), 
          child: Text(
            '${game.bakedGoodsInventory}',
            style: TextStyle(fontSize: 25, color: Colors.black45)),
        ),
        ],
        );
  }
}