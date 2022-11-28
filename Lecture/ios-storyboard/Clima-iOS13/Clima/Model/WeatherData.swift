//
//  WeatherData.swift
//  Clima
//
//  Created by 지상률 on 2022/09/26.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable { //JSON representation을 decode하는 protocol
    let name: String
    let main: Main
    let weather: [Weather] //JSON에서 weather[0]으로 path가 되어있어서 맞춰준 상황`
    
}
    
struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
//MARK: property의 이름을 함부로 바꾸면 안된다. JSON에서 경로대로 struct와 property를 만들어줘야한다.
