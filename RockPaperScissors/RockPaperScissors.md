#  RockPaperScissors


## 소개
### 튜나(페페 캐릭터)와 만두(만두 캐릭터) 이미지 컨셉을 활용한 가위바위보 게임


## 프로젝트 기간


##



## 후기

1. Debug View Hierarchy
	- Show Clipped Content를 통해 화면 밖의 뷰들도 확인 가능했던점이 유용했음
	- 앱 실행 중 원하는 시점에서 View Hierarchy를 볼 수 있엇던 점도 유용했음
2. 애니메이션, 뷰 위치 수정
	- 오토레이아웃과 애니메이션의 관계
		- 애니메이션은 오토레이아웃 사용시 frame, bounds, ...의 수정사항은 적용 안됨
		- 애니메이션은 오토레이아웃 사용시 CGAffineTransform에서만 가능했음 
		- 애니메이션은 오토레이아웃을 변수에 담아 자체 수정은 적용 가능??
3. didSet 활용
	- didSet과 Closure를 활용한 MVVM 패턴
		- didSet과 Closure의 활용으로 코드가 깔끔해졌음
	- didSet의 타이밍 문제가 생각보다 까다로웠음 
		- update 함수를 통해 Model 객체의 프로퍼티들의 값들이 한번에 수정하도록 함
		- 게임이 끝나고 값들을 초기상태로 되돌릴시, didSet이 예상치 못한 동작을 하는 경우도 있엇음
4. 
