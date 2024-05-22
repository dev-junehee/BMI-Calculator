# BMI-Calculator

> **BMI 계산법**<br />
> 신체질량지수(BMI) = $체중(kg) / (신장(m))^2$

<br />

## Study for
- Auto Layout
- TextField, Button, @Outlet, @IBAction
- UIAlertController, Alert, Actionsheet
    - style: default, destructive, cancel
- 함수의 반환 값, @discardableResult
- Optional Chaining, Optional Binding
- UserDefaults

<br />

## To-do
### 기능
- [ ] 키와 몸무게 입력 받기
    - [x] 숫자 키패드 사용
    - [x] Int, Float, Double(정수와 실수) 구분
    - [ ] 몸무게 입력 시 입력값 안보이게 설정
    - [x] UserDefaults에 데이터 저장
    - [x] 기존 데이터 기록이 남아있으면 TextField에 기본 노출
    - [x] 초기화 버튼 클릭 시 UserDefaults 데이터 삭제
- [x] 키보드 내리기
    - [x] 백그라운드 tap 했을 때
    - [ ] ~~키보드 return 눌렀을 때~~ (→ 숫자 키패드로 변경)
- [x] BMI 계산하기
    - [x] BMI 계산 함수 생성
    - [x] 키와 몸무게 매개변수 받기
    - [x] 신장 단위 변경 (cm(센티미터) → m(미터))
    - [x] BMI 결과 Alert 연결
    - [x] BMI 결과 소숫점 반올림
- [x] 랜덤으로 BMI 계산하기
    - [x] 임의의 데이터 셋 구성 (→ `Double.random()` 사용)
    - [x] 랜덤한 값으로 BMI 계산
- [x] 예외 처리 (옵셔널 체이닝, 옵셔널 바인딩)
    - [x] 키/몸무게 텍스트 필드에 문자가 입력됐을 때
    - [x] 키/몸무게 범위가 잘못됐을 때 (일반적이지 않은 경우)
    - [x] 공백이나 빈칸이 입력됐을 때
### 디자인
- [x] AutoLayout을 활용한 화면 배치 (다양한 기종 대응)
    - [x] iPhone SE
    - [x] iPhone 13 mini
    - [x] iPhone 15
    - [x] iPhone 15 Pro
    - [x] iphoone 15 Pro Max
- [ ] TextField
    - [ ] highlight borderColor 변경
    - [x] 왼쪽 패딩 (UITextField.leftView, .leftViewMode 사용)
- [x] Alert

<br />

## Refactoring
#### 24-05-22 (Wed)
- [x] 반복되는 코드 함수화
- [x] UserDefaults 사용한 사용자 데이터 영구 저장/삭제

<br />

## 화면 구성

| **런치 스크린** | **메인 화면** | **메인 화면<br />(UserDefaults 있을 때)** |
|:--------:|:-------:|:-----:|
| | <img width="40" alt="메인화면" src="https://github.com/dev-junehee/BMI-Calculator/assets/116873887/e6c53e1b-3527-497a-92d7-92f820854a7f">
 | |
 | **Alert**<br />(키가 범위를 벗어났을 때) | **Alert**<br />(몸무게가 범위를 벗어났을 때) | **Alert**<br />(랜덤 버튼 클릭했을 때) |
 | <img width="507" alt="Alert-height" src="https://github.com/dev-junehee/BMI-Calculator/assets/116873887/c7ca9e1a-b9e7-47d3-9508-561f44c71c65">
 | | |

<br />

## Question
<details>
<summary>Swift에서 상수 선언 시 상수명 명명법</summary>
<div markdown="1">
JavaScript에서 상수(Constants) 데이터를 만들 때 객체를 활용해 선언하고, 상수명은 대문자 스네이크 케이스(e.g. TEXT_DATA)를 활용했었다. Swift에서는 기본으로 카멜 케이스(camelCase)를 사용하고 카멜 케이스 안에서도 Lower Camel Case 와 Upper Camel Case로 나뉘어지는데, 상수 선언의 경우에는 Lower Camel Case를 사용한다고 한다. 따라서 앱에서 사용할 문자열을 딕셔너리(Dictionary)를 활용해 상수를 선언하고, 상수명은 Lower Camel Case 규칙을 적용해주었다.

</div>
</details>

<br />

## Trouble Shooting
<details>
<summary>AppDeleagate에서 Thread 1: signal SIGTERM error</summary>
여러 개의 시뮬레이터를 켜놓고 테스트 하던 중 시뮮레이터를 종료하니 AppDelegate에서 Thread 1 Error 발생
Xcode에서 시뮬레이터를 종료할 때 Cmd + Q를 사용해야 한다고 한다. (iOS 13 이후부터 AppDelegate에서 앱의 생성과 종료 시점 통제)
</div>
</details>

<details>
<summary>숫자 키패드 입력값 입력 후 userData에 할당되지 않는 이슈</summary>
userHeight, userWeight 데이터를 받을 UITextField에서 키보드 내리기 기능을 추가하기 위해 이벤트를 Did End On Exit으로 설정 후 keyboardType을 decimalPad로 변경하니 입력값이 userHeight, userWeight 변수에 할당이 안 됨. 각 TextField의 IBAction 함수에 이벤트를 Editing Did End를 추가로 연결하여 해결.
</div>
</details>

<details>
<summary>텍스트 필드에 UserDefaults에 저장된 값을 할당했을 때 BMI 계산 안 되는 이슈</summary>
BMI를 계산하는 함수는 userHeight, userWeight 값으로 계산을 하는데, UserDefaults에 저장된 값을 텍스트 필드의 text에만 할당하고, userHeight와 userWeight에는 할당하지 않아 BMI 계산이 안 되는 문제 발생. viewDidLoad()에서 초기 화면 로드 시 UserDefault에 저장된 값이 기본 값(0.0)이 아닐 경우에는 텍스트 필드에 노출하고, 0.0일 경우에는 빈 문자열을 넣어주어 해결.
</div>
</details>
