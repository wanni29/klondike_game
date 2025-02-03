import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:klondike_game/components/card.dart';
import 'package:klondike_game/components/foundation_pile.dart';
import 'package:klondike_game/components/stock_pile.dart';
import 'package:klondike_game/components/tableau_pile.dart';
import 'package:klondike_game/components/waste_pile.dart';

class KlondikeGame extends FlameGame {
  final int klondikeDraw = 1;

  static const double cardGap = 175.0;
  static const double cardWidth = 1000.0;
  static const double cardHeight = 1400.0;
  static const double cardRadius = 100.0;
  static final Vector2 cardSize = Vector2(cardWidth, cardHeight);
  static final cardRRect = RRect.fromRectAndRadius(
    const Rect.fromLTWH(0, 0, cardWidth, cardHeight),
    const Radius.circular(cardRadius),
  );

  @override
  Future<void> onLoad() async {
    await Flame.images.load('klondike-sprites.png');

    final stock = StockPile()
      ..size = cardSize
      ..position = Vector2(cardGap, cardGap);

    final waste =
        WastePile(position: Vector2(cardWidth + 2 * cardGap, cardGap));

    final foundations = List.generate(
      4,
      (i) => FoundationPile(
        i,
        position: Vector2((i + 3) * (cardWidth + cardGap) + cardGap, cardGap),
      ),
    );

    final piles = List.generate(
      7,
      (i) => TableauPile(
        position: Vector2(
          cardGap + i * (cardWidth + cardGap),
          cardHeight + 2 * cardGap,
        ),
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

    final cards = [
      for (var rank = 1; rank <= 13; rank++)
        for (var suit = 0; suit < 4; suit++) Card(rank, suit)
    ];

    cards.shuffle();
    world.addAll(cards);

    var cardToDeal = cards.length - 1;
    for (var i = 0; i < 7; i++) {
      for (var j = i; j < 7; j++) {
        piles[j].acquireCard(cards[cardToDeal--]);
      }
      piles[i].flipTopCard();
    }
    for (var n = 0; n <= cardToDeal; n++) {
      stock.acquireCard(cards[n]);
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
