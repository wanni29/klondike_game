import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:klondike_game/klondike_game.dart';

void main() {
  // FlameGame 클래스란 ?
  // 게임 상태의 중앙 저장소 역할 (게임루프 실행, 이벤트 전달)
  final game = KlondikeGame();
  runApp(GameWidget(game: game));
}
