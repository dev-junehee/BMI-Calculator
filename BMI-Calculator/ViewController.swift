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
        "result": "결과 확인하기"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureInitialUI()
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

        weightLabel.text = messages["weight"]
        weightLabel.textAlignment = .left
        weightLabel.font = .systemFont(ofSize: 14, weight: .light)
        
        weightTextField.layer.borderWidth = 1
        weightTextField.borderStyle = .none
        weightTextField.layer.borderColor = UIColor.gray.cgColor
        weightTextField.layer.cornerRadius = 20
        
        randomButton.setTitle(messages["random"], for: .normal)
        randomButton.setTitleColor(.purple, for: .normal)
        randomButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        
        resultButton.setTitle(messages["result"], for: .normal)
        resultButton.setTitleColor(.white, for: .normal)
        resultButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        resultButton.layer.cornerRadius = 20
        resultButton.backgroundColor = .purple
    }

        
}

    
