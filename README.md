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
- Optional chaining, Optional Binding

<br />

## To-do
### 기능
- [ ] 키와 몸무게 입력 받기
    - [ ] 숫자 키패드 사용
    - [ ] Int, Float, Double (정수와 실수)구분
    - [ ] 몸무게 입력 시 입력값 안보이게 설정
- [ ] 키보드 내리기
    - [ ] 백그라운드 tap 했을 때
    - [ ] 키보드 return 눌렀을 때
- [ ] BMI 계산하기
    - [ ] BMI 계산 함수 생성
    - [ ] 키와 몸무게 매개변수 받기
    - [ ] 신장 단위 변경 (cm(센티미터) ➔ m(미터))
    - [ ] 리턴값 Alert 연결
- [ ] 랜덤으로 BMI 계산하기
    - [ ] 임의의 데이터 셋 구성
    - [ ] 랜덤한 값으로 BMI 계산
- [ ] 예외 처리 (옵셔널 체이닝, 옵셔널 바인딩)
    - [ ] 키/몸무게 텍스트 필드에 문자가 입력됐을 때
    - [ ] 키/몸무게 범위가 잘못됐을 때 (일반적이지 않은 경우)
    - [ ] 공백이나 빈칸이 입력됐을 때
### 디자인
- [x] AutoLayout을 활용한 화면 배치 (다양한 기종 대응)
    - [x] iPhone SE
    - [x] iPhone 13 mini
    - [x] iPhone 15
    - [x] iPhone 15 Pro
    - [x] iphoone 15 Pro Max
- [ ] TextField
    - [ ] highlight borderColor 변경
    - [ ] left padding
- [ ] Alert

<br />

## 화면 구성

| **런치 스크린** | **메인 화면** | **Alert** |
|:--------:|:-------:|:-----:|
| | |

<br />

## Question
<details>
<summary>Swift에서 상수 선언 시 상수명 명명법</summary>
<div markdown="1">
JavaScript에서 상수(Constants) 데이터를 만들 때 객체를 활용해 선언하고, 상수명은 대문자 스네이크 케이스(e.g. TEXT_DATA)를 활용했었다.

Swift에서는 기본으로 카멜 케이스(camelCase)를 사용하고 카멜 케이스 안에서도 Lower Camel Case 와 Upper Camel Case로 나뉘어지는데, 상수 선언의 경우에는 Lower Camel Case를 사용한다고 한다. 따라서 앱에서 사용할 문자열을 딕셔너리(Dictionary)를 활용해 상수를 선언하고, 상수명은 Lower Camel Case 규칙을 적용해주었다.

</div>
</details>
