//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by junehee on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    
    @IBOutlet var mainImage: UIImageView!
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var heightTextField: UITextField!
    
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var weightTextField: UITextField!
    
    @IBOutlet var randomButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    
    // 문자열 상수 데이터
    let messages: [String: String] = [
        "title": "BMI Calculator",
        "subTitle": "당신의 BMI 지수를\n알려드릴게요.",
        "height": "키가 어떻게 되시나요?",
        "weight": "몸무게는 어떻게 되시나요?",
        "random": "랜덤으로 BMI 계산하기",
        "result": "결과 확인하기",
        "alertTitle": "당신의 BMI 지수 결과입니다",
        "alertRandomTitle": "랜덤 BMI 지수 결과입니다",
        "alertErrorTitle": "올바른 숫자값을 입력해 주세요!",
        "alertHeightError": "100 ~ 199(cm)",
        "alertWeightError": "0 ~ 200(kg)"
    ]
    
    // User 입력값
    var userHeight: Double = 0.0
    var userWeight: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureInitialUI()
    }
    
    // 레이블 UI 디자인 함수
    func designLabel(_ label: UILabel, text: String?, size: Int, weight: UIFont.Weight, align: NSTextAlignment) {
        label.text = text
        label.textAlignment = align
        label.font = .systemFont(ofSize: CGFloat(size), weight: weight)
        label.backgroundColor = .clear
        label.numberOfLines = 0
    }
    
    // 텍스트 필드 UI 디자인 함수
    func designTextField(_ textField: UITextField ) {
        textField.borderStyle = .none  // 기본 스타일 제거
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 20
    }
    
    // 이미지뷰 UI 디자인 함수
    func designImageView(_ imageView: UIImageView, image: String, bgColor: UIColor, contentMode: UIImageView.ContentMode) {
        imageView.image = UIImage(named: image)
        imageView.backgroundColor = bgColor
        imageView.contentMode = contentMode
    }
    
    // 메인화면 초기 UI 구성
    // ( 추후 별도 함수로 분리하기!!!!!! )
    func configureInitialUI() {
        // 타이틀, 서브타이틀
        designLabel(titleLabel, text: messages["title"], size: 26, weight: .bold, align: .left)
        designLabel(subTitleLabel, text: messages["subTitle"], size: 16, weight: .medium, align: .left)
        
        // 메인 이미지
        designImageView(mainImage, image: "image", bgColor: .clear, contentMode: .scaleAspectFit)
        
        // 키, 몸무게TextField
        designLabel(heightLabel, text: messages["height"], size: 14, weight: .light, align: .left)
        designTextField(heightTextField)
        
        designLabel(weightLabel, text: messages["weight"], size: 14, weight: .light, align: .left)
        designTextField(weightTextField)
        
        heightTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 0.0)) // 텍스트 필드 왼쪽 여백 넣기
        heightTextField.leftViewMode = .always
        heightTextField.keyboardType = .decimalPad // 숫자 키패드

        
        
        weightTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 0.0)) // 텍스트 필드 왼쪽 여백 넣기
        weightTextField.leftViewMode = .always
        weightTextField.keyboardType = .decimalPad // 숫자 키패드
        
        randomButton.setTitle(messages["random"], for: .normal)
        randomButton.setTitleColor(.purple, for: .normal)
        randomButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        
        resultButton.setTitle(messages["result"], for: .normal)
        resultButton.setTitleColor(.white, for: .normal)
        resultButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        resultButton.layer.cornerRadius = 20
        resultButton.backgroundColor = .purple
    }
    
    // BMI 계산 함수
    func calculateBMI(height: Double, weight: Double) -> Double {
        let convertHeight = height / 100
        let BMI = weight / (pow(convertHeight, 2))
        return BMI
    }
    
    // BMI 반올림 계산 함수
    func roundBMI(BMI: Double) -> Double {
        return round(BMI * 100) / 100
    }
    
    // 입력값 유효성 검사
    // height(키): 100~199
    // weight(몸무게): 0~200
    func validateUserData(data: Double, type: String) -> Bool {
        print("유효성", data)
        
        if type == "height" {
            return data > 200.0 || data < 100 ? false : true
        } else if type == "weight" {
            return data > 200 || data < 0 ? false : true
        } else {
            print("잘못된 접근입니다.")
            return false
        }
    }
    
    // 키 텍스트 필드 핸들러 - 입력값 받기, 키보드 내리기 (Did End On Exit)
    @IBAction func heightTextFieldClicked(_ sender: UITextField) {
        // 키 입력값(String)이 nil일 때 "0.0" 할당
        // Double로 변환했을 때 nil이면 0.0 할당
        let convertHeight = Double(heightTextField.text ?? "0.0") ?? 0.0
        // 키 값이 유효한지 확인 (100~199 사이 값)
        let flag = validateUserData(data: convertHeight, type: "height")
        
        // 유효성 검사 미통과 - Alert, 입력값 초기화
        // 유효성 검사 통화 - userHeight 변수에 할당
        if !flag {
            let alert = UIAlertController(
                title: messages["alertErrorTitle"],
                message: messages["alertHeightError"],
                preferredStyle: .alert)
            
            let open = UIAlertAction(title: "확인", style: .default)
            alert.addAction(open)
            present(alert, animated: true)
            
            heightTextField.text = ""
            return
        } else {
            userHeight = convertHeight
        }
        print("키에용", userHeight)
    }
    
    // 몸무게 텍스트 필드 핸들러 - 입력값 받기, 키보드 내리기 (Did End On Exit)
    @IBAction func weightTextFieldClicked(_ sender: UITextField) {
        let convertWeight = Double(weightTextField.text ?? "0.0") ?? 0.0
        let flag = validateUserData(data: convertWeight, type: "weight")

        if !flag {
            let alert = UIAlertController(
                title: messages["alertErrorTitle"],
                message: messages["alertWeightError"],
                preferredStyle: .alert)
            
            let open = UIAlertAction(title: "확인", style: .default)
            alert.addAction(open)
            present(alert, animated: true)
            
            weightTextField.text = ""
            return
        } else {
            userWeight = convertWeight
        }
        print("몸무게에용", userWeight)
    }
    
    // 랜덤 계산 버튼 (Int 타입으로만 출력)
    @IBAction func randomButtonClicked(_ sender: UIButton) {
        let randomData = [
            Double.random(in: 100...199),
            Double.random(in: 0...200)]
        
        let randomUserBMI = calculateBMI(height: randomData[0], weight: randomData[1])
        
        let alert = UIAlertController(
            title: messages["alertRandomTitle"],
            message: "키(cm): \(Int(randomData[0]))\n몸무게(kg): \(Int(randomData[1]))\n BMI:\(Int(randomUserBMI))",
            preferredStyle: .alert)
        
        let open = UIAlertAction(title: "확인", style: .default)
        alert.addAction(open)
        present(alert, animated: true)
        
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    // 결과 확인 버튼 핸들
    @IBAction func resultButtonClicked(_ sender: UIButton) {
        // 유저 데이터 중 하나라도 0.0이면 Alert
        if (userHeight == 0.0 || userWeight == 0.0) {
            let alert = UIAlertController(
                title: messages["alertErrorTitle"],
                message: messages["alertWeightError"],
                preferredStyle: .alert)
            
            let open = UIAlertAction(title: "확인", style: .default)
            alert.addAction(open)
            present(alert, animated: true)
            
            heightTextField.text = ""
            weightTextField.text = ""
            return
        }
        
        let userBMI = calculateBMI(height: userHeight, weight: userWeight)
        let roundBMI = roundBMI(BMI: userBMI)
        
        let alert = UIAlertController(
            title: messages["alertTitle"],
            message: String(roundBMI),
            preferredStyle: .alert)
        
        let open = UIAlertAction(title: "확인", style: .default)
        alert.addAction(open)
        present(alert, animated: true)
        
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    // 키보드 내리기 (tap gesture)
    @IBAction func keyboardDismiss(_ sender: Any) {
        heightTextField.layer.borderColor = UIColor.gray.cgColor
        weightTextField.layer.borderColor = UIColor.gray.cgColor
        view.endEditing(true)
    }
        
}

    
