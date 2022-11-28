//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculateBrain = CalculateBrain()
//    var bmiValue = "0.0"
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func heightSliderChanged(_ sender: UISlider) {
//        heightLabel.text = "\(String(format: "%.2f", sender.value))m"
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = "\(String(format: "%.0f", sender.value))Kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
//        let BMI = Float(weight) / Float(Int(height) ^ 2)
//        let bmi = weight / pow(height,2) //제곱하는 법
//        bmiValue = String(format: "%.2f", bmi)
        calculateBrain.calculateBMI(height: height, weight: weight)//model에는 이 앱에서 전체에 필요로하는 데이터인 bmi와 advice, color등의 데이터가 저장되어있다.
        self.performSegue(withIdentifier: "goToResult", sender: self)
        //calculatePressed 버튼이 눌렸을 때, 이전에 지정한 segue와 보내는 initializer(self - calculateViewController)를 이용하여 새로운 결과화면과 이어주는 과정이다.
        
//        let secondVC = SecondViewController()
//        secondVC.bmiValue = String(format: "0.1f", bmi)
//
//        self.present(secondVC, animated: true, completion: nil)//즉시 화면에 보여지게 해주는 역할
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" { //crash를 막기위해 identifier가 우리가 원하는 identifier가 맞는 지 확인해주는 과정이다.
            let destinationVC = segue.destination as! ResultViewController
            //segue.destination is view controller that will be initialized when the segue gets performed. 한마디로 segue가 발생했을 때, 생기게 되는 view controller를 지칭한다.
            
            //as를 통해 다운캐스팅을 해준 이유는 segue.destination은 UIViewController 타입이라서 bmiValue라는 property에 접근하기 위해서는 as를 통해 다운캐스팅 해줘야한다.
            destinationVC.bmiValue = calculateBrain.getBMIValue()
            destinationVC.advice = calculateBrain.getAdvice()
            destinationVC.color = calculateBrain.getColor()
        }
    } //segue initiates전에 이 코드를 통해서 정보인 bmi를 전달해준다. segue의 준비단계라고 생각하면 된다.
}

// MARK: - attention
//performSegue를 통해서 다음 viewController로 가는 길을 열어준 것이고, prepare를 통해 열어준 segue를 통해 원하는 데이터를 다음 viewController로 보내주는 것이다.
//결국 resultController의 view는 결과만 보여주는 곳이기 때문에 model에서 잘 정제된 데이터를 controller(calculate)에서 받아와 잘 넘겨줘야한다.
