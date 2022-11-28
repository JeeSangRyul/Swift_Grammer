//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
//manage the editing text or text field

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchTextField.delegate = self //textField가 user의 상황을 현재 viewController에게 알려주는 역할을 하는 코드이다.
    }

    @IBAction func searchPressed(_ sender: UITextField) {
        searchTextField.endEditing(true) //타이핑이 끝나고 돋보기 버튼을 누를경우 자동으로 키보드가 사라진다.
        print(searchTextField.text ?? "Empty")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)//타이핑이 끝나고 go버튼을 누르면 자동으로 키보드가 사라진다.
        print(searchTextField.text!)
        return true
    } //textField를 채운뒤 return버튼을 누르면 작동하게 되는 함수

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Something" //검색창에 default로 옅은 글씨인 상태로 있는 것을 지칭한다.
            return false
        }
    }
    //method에 "should"가 들어있는 경우 viewController에게 권한에 대한 허가를 묻는 로직이다.
    //textFieldShouldEndEditing는 textField에 아무것도 입력되지 않았을 상황을 다루는 데 유용하다.
    //textField 파라미터가 uibutton에서 sender역할을 해준다.
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        //Use search
        searchTextField.text = "" //endEditing을 하고 난뒤에 작동하게 되는 함수
    }
    
    func didUpdateWeather(weather: WeatherModel) {
        print(weather.temperature)
    }
}

