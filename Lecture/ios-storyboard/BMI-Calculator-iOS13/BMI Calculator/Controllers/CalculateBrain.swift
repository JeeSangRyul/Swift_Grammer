//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by 지상률 on 2022/09/20.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculateBrain {
    
    var bmi : BMI? // bmi는 weight와 height가 정확할 때 나와야하는 값이기 때문에 미리부터 init을 하는 것 보다는 ?로 두어 nil일 가능성을 열어둔다.
    
    func getBMIValue() -> String {
//        if let safeBMI = bmi {
//            let bmiTo1DecimalPlace = String(format: "%.1", safeBMI) //강제 언랩핑을 할 수 없다. 왜냐하면 calculateBMI를 거친다음 bmi가 생기고 bmiTO1DecimalPlace가 생기기 때문에 함부러 강제 언랩핑을 할 수 없다.
//            return bmiTo1DecimalPlace
//        } else {
//            return "0.0"
//        }
        let bmiTo1DecimalPlace = String(format: "%.1", bmi?.value ?? 0.0)//optional chaining 때문에 ?가 자동으로 생긴다
        return bmiTo1DecimalPlace //더 깔끔하고 직관적이다
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }

    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height,2)
        
        if bmiValue < 18.5 {
            print("underweight")
            bmi = BMI(value: bmiValue, advice: "eat more anything", color: UIColor.blue)
        } else if bmiValue < 24.9 {
            print("normal weight")
            bmi = BMI(value: bmiValue, advice: "fit as a fiddle", color: UIColor.green)
        } else {
            print("overweight")
            bmi = BMI(value: bmiValue, advice: "eat less", color: UIColor.red)
        }
    }
}
