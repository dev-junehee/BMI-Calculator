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
        "alertTitle": "당신의 BMI 지수 결과입니다."
    ]
    
    // User 입력값
    var userHeight: Double = 0.0
    var userWeight: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureInitialUI()
        
        print(calculateBMI(height: 159.1, weight: 55.0))
    }
    
    // 메인화면 초기 UI 구성
    // ( 추후 별도 함수로 분리하기!!!!!! )
    func configureInitialUI() {
        titleLabel.text = messages["title"]
        titleLabel.backgroundColor = .clear
        titleLabel.font = .systemFont(ofSize: 26, weight: .bold)
        
        subTitleLabel.text = messages["subTitle"]
        subTitleLabel.numberOfLines = 0
        subTitleLabel.backgroundColor = .clear
        subTitleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        mainImage.image = UIImage(named: "image")
        mainImage.backgroundColor = .clear
        mainImage.contentMode = .scaleAspectFit
        
        heightLabel.text = messages["height"]
        heightLabel.textAlignment = .left
        heightLabel.font = .systemFont(ofSize: 14, weight: .light)
        
        heightTextField.layer.borderWidth = 1
        heightTextField.borderStyle = .none
        heightTextField.layer.borderColor = UIColor.gray.cgColor
        heightTextField.layer.cornerRadius = 20
        heightTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 0.0)) // 텍스트 필드 왼쪽 여백 넣기
        heightTextField.leftViewMode = .always
        heightTextField.keyboardType = .decimalPad // 숫자 키패드

        weightLabel.text = messages["weight"]
        weightLabel.textAlignment = .left
        weightLabel.font = .systemFont(ofSize: 14, weight: .light)
        
        weightTextField.layer.borderWidth = 1
        weightTextField.borderStyle = .none
        weightTextField.layer.borderColor = UIColor.gray.cgColor
        weightTextField.layer.cornerRadius = 20
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
    
    // 키 텍스트 필드 핸들러 - 입력값 받기, 키보드 내리기 (Did End On Exit)
    @IBAction func heightTextFieldClicked(_ sender: UITextField) {
        // 키 입력값(String)이 nil일 때 "0.0" 할당
        // 키 입력값을 Double로 변환했을 때 nil이 아니라면 userHeight에 해당 값 할당
        // nil이라면 0.0 할당
        let heightStringValue = heightTextField.text ?? "0.0"
        if let heightDoubleValue = Double(heightStringValue) {
            userHeight = heightDoubleValue
        } else {
            userHeight = 0.0
        }
    }
    
    // 몸무게 텍스트 필드 핸들러 - 입력값 받기, 키보드 내리기 (Did End On Exit)
    @IBAction func weightTextFieldClicked(_ sender: UITextField) {
        let weightStringValue = weightTextField.text ?? "0.0"
        if let weightDoubleValue = Double(weightStringValue) {
            userWeight = weightDoubleValue
        } else {
            userWeight = 0.0
        }
    }
    
    // 결과 확인 버튼 핸들
    @IBAction func resultButtonClicked(_ sender: UIButton) {
        var resultBMI = calculateBMI(height: userHeight, weight: userWeight)
        
        
        // 1.바탕, 내용
        let alert = UIAlertController(
            title: messages["alertTitle"],
            message: String(resultBMI),
            preferredStyle: .alert)
        
        // 2.버튼
        let open = UIAlertAction(title: "확인", style: .default)
        
        // 3.버튼합치기
        alert.addAction(open)
        
        // 4.화면에 띄우기
        present(alert, animated: true)
    }
    
    // 키보드 내리기 (tap gesture)
    @IBAction func keyboardDismiss(_ sender: Any) {
        view.endEditing(true)
    }
        
}

    
