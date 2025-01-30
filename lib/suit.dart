import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';
import 'package:klondike_game/klondike_game.dart';

// @immutable -> 객체가 생성된 이후 수정이 되면 안된다.
@immutable
class Suit {
  // factory -> 생성된 객체를 계속해서 쓴다. ( 객체를 계속 만들지 않음 ! )
  factory Suit.fromInt(int index) {
    assert(
      index >= 0 && index <= 3,
    );
    return _singletons[index];
  }

  // Suit._ -> 이거는 처음 보는건데, 자바로 치면 private을 의미하는거야.
  // Suit 클래스 안에서만 비공개적으로 사용이 가능하다는 말
  // Suit.sprite = klondikeSprite(매개변수)와 같은 코드임
  Suit._(this.value, this.label, double x, double y, double w, double h)
      : sprite = klondikeSprite(x, y, w, h);

  final int value;
  final String label;
  final Sprite sprite;

  static final List<Suit> _singletons = [
    Suit._(0, '♥', 1176, 17, 172, 183),
    Suit._(1, '♦', 973, 14, 177, 182),
    Suit._(2, '♣', 974, 226, 184, 172),
    Suit._(3, '♠', 1178, 220, 176, 182),
  ];

  bool get isRed => value <= 1;
  bool get isBlack => value >= 2;
}
