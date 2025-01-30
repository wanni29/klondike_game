# klondike_game

# 카드게임 만들기 클론코딩
- 출저 :  FLAME 공식 사이트
- 출저 소스 : https://docs.flame-engine.org/latest/tutorials/klondike/step1.html


# 에러 기록 모음
- [2025.01.30.목요일]
에러내용 : Try correcting the name to the name of an existing method, or defining a method named 'withValues'.
paint.color = paint.color.withValues(alpha:value);
- 원인 및 해결 : 'flame' 라이브러리 안에서 1.23.0버전이 가장 최신버전인데 'withValues'라는 메소드에 대한 정의를 패키지 만들때 안해줘서 나타나는 에러 현상임. 'defining a method...' 라고 나오게 되면 메소드를 정의를 안해주었다고 보면됨. 이럴때는 1.22.0버전, 즉 최신버전의 하위 버전을 사용하여 안정화(메소드에 대한 정의가 완벽하게 되어있는 것)을 사용하면 에러가 해결됨.
단, 주의할것은 pubspec.yaml에 입력을 할때 ^1.22.0이라고 입력하면 안됨. '^' -> 이 표시가 의미하는 바는 '내가 이 라이브러리를 사용할건데 지금 가장 최신화 되어있는 버전을 사용할 수 있도록 너가 라이브러리 다운 받을때 최신화 된걸로 알아서 다운 받아'라는 의미임 그렇기 때문에 '1.22.0'버전이라고 명시적으로 입력해주어야 함.