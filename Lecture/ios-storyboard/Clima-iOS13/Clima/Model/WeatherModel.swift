//
//  WeatherModel.swift
//  Clima
//
//  Created by 지상률 on 2022/09/26.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    //Stored property
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String{
        return String(format: "%.1f", temperature)
    }
    
    //Computed property syntax
    var aProperty: Int {
        return 2 + 5
    }
    
    
    //Computed property
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    //아래있는 method를 부르기 보다는 연산프로퍼티로 밖에서 접근 가능하도록 만들었다.
    
    //    func getConditionName(weatherId: Int) -> String{
    //        switch weatherId {
    //        case 200...232:
    //            return "cloud.bolt"
    //        case 300...321:
    //            return "cloud.drizzle"
    //        case 500...531:
    //            return "cloud.rain"
    //        case 600...622:
    //            return "cloud.snow"
    //        case 701...781:
    //            return "cloud.fog"
    //        case 800:
    //            return "sun.max"
    //        case 801...804:
    //            return "cloud.bolt"
    //        default:
    //            return "cloud"
    //        }
    //    }
}
