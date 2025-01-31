import 'package:klondike_game/components/card.dart';

// 추상 클래스로써 implement를 하게되면 도면을 얻게 되고,
// 도면을 통해서 실체를 만드는거임
abstract class Pile {
  bool canMoveCard(Card card);

  bool canAcceptCard(Card card);

  void removeCard(Card card);

  void acquireCard(Card card);

  void returnCard(Card card);
}
