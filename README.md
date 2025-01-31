# klondike_game

# 카드게임 만들기 클론코딩
- 출저 :  FLAME 공식 사이트
- 출저 소스 : https://docs.flame-engine.org/latest/tutorials/klondike/step1.html


# GameLoop에 대한 개념을 숙지 필요  - rendering 관련있음


# Sprite 기능 사용법
-  출저 : http://www.spritecow.com/
- 사용법 : 이미지 한장에 다양한 그림을 넣어둔 이후 Sprite는 이것을 가위로 여러부위를 오려서 붙여넣듯이 사용이 되는 개념인데, 가위로 자르기 위해서는 이미지에 대한 각각의 좌표값이 필요하다.
일일히 좌표값을 찾기 힘들기 때문에 출저사이트로 이동 후 이미지를 업로드, 자르고자 하는 부위를 클릭하게 되면 이미지의 좌표값을 제공한다. 그 이후 그 좌표값을 매개변수에 넣어주기만 하면 원하는 대로 사용가능하다.


# 에러 기록 모음
- [2025.01.30.목요일]
에러내용 : Try correcting the name to the name of an existing method, or defining a method named 'withValues'.
paint.color = paint.color.withValues(alpha:value);
- 원인 및 해결 : 'flame' 라이브러리 안에서 1.23.0버전이 가장 최신버전인데 'withValues'라는 메소드에 대한 정의를 패키지 만들때 안해줘서 나타나는 에러 현상임. 'defining a method...' 라고 나오게 되면 메소드를 정의를 안해주었다고 보면됨. 이럴때는 1.22.0버전, 즉 최신버전의 하위 버전을 사용하여 안정화(메소드에 대한 정의가 완벽하게 되어있는 것)을 사용하면 에러가 해결됨.
단, 주의할것은 pubspec.yaml에 입력을 할때 ^1.22.0이라고 입력하면 안됨. '^' -> 이 표시가 의미하는 바는 '내가 이 라이브러리를 사용할건데 지금 가장 최신화 되어있는 버전을 사용할 수 있도록 너가 라이브러리 다운 받을때 최신화 된걸로 알아서 다운 받아'라는 의미임 그렇기 때문에 '1.22.0'버전이라고 명시적으로 입력해주어야 함.
