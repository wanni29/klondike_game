import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:klondike_game/components/card.dart';
import 'package:klondike_game/components/foundation.dart';
import 'package:klondike_game/components/pile.dart';
import 'package:klondike_game/components/stock.dart';
import 'package:klondike_game/components/waste.dart';

class KlondikeGame extends FlameGame {
  static const double cardGap = 175.0;
  static const double cardWidth = 1000.0;
  static const double cardHeight = 1400.0;
  static const double cardRadius = 100.0;
  static final Vector2 cardSize = Vector2(cardWidth, cardHeight);

  @override
  Future<void> onLoad() async {
    await Flame.images.load('klondike-sprites.png');

    final stock = Stock()
      ..size = cardSize
      ..position = Vector2(cardGap, cardGap);

    final waste = Waste()
      ..size = cardSize
      ..position = Vector2(cardWidth + 2 * cardGap, cardGap);

    final foundations = List.generate(
      4,
      (i) => Foundation()
        ..size = cardSize
        ..position = Vector2(
          (i + 3) * (cardWidth + cardGap) + cardGap,
          cardGap,
        ),
    );

    final piles = List.generate(
      7,
      (i) => Pile()
        ..size = cardSize
        ..position = Vector2(
          cardGap + i + (cardWidth + cardGap),
          cardHeight + 2 * cardGap,
        ),
    );

    world.add(stock);
    world.add(waste);
    world.addAll(foundations);
    world.addAll(piles);

    // 화면에 얼마만큼 보여줄꺼냐
    camera.viewfinder.visibleGameSize =
        Vector2(cardWidth * 7 + cardGap * 8, 4 * cardHeight + 3 * cardGap);
    // 뷰포트를 어디에 배치할것이냐
    camera.viewfinder.position = Vector2(cardWidth * 3.5 + cardGap * 4, 0);
    // 뷰포트를 배치했을때 기준점을 어디로 할꺼냐
    camera.viewfinder.anchor = Anchor.topCenter;

    final random = Random();
    for (var i = 0; i < 7; i++) {
      for (var j = 0; j < 4; j++) {
        final card = Card(random.nextInt(13) + 1, random.nextInt(4))
          ..position = Vector2(100 + i * 1150, 100 + j * 1500)
          // ..position = Vector2(100 + i * 1150, 100 * 3* 1500)
          ..addToParent(world);

        // 90%의 확률로 카드가 뒤집힌다.
        if (random.nextDouble() < 0.9) {
          card.flip();
        }
      }
    }
  }
}

// 하나의 이미지를 짤라서 그림을 붙이는 클래스 : Sprite
Sprite klondikeSprite(double x, double y, double width, double height) {
  return Sprite(
    Flame.images.fromCache('klondike-sprites.png'), // 자를 이미지
    srcPosition: Vector2(x, y), // 시작점
    srcSize: Vector2(width, height), // 크기
  );
}
