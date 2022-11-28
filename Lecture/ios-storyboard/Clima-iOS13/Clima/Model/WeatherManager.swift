import Foundation


protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=1fa18d35d94b813eec00ea3753ae6e96&units=metric" //url의 순서는 상관없다
    
    var delegate: WeatherManagerDelegate?
    
    
    func fetchWeather(cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String) {
        //1.Create a URL
        if let url = URL(string: urlString) {
            //2.Create a URLSession
            //perform the networking
            //디스크 지속(disk-persisted) 전역 캐시, 자격 증명(credential) 과 쿠기 저장 객체를 사용하는 기본 구성 객체(default configuration object)를 생성합니다.
            //http를 처리하기 위해 클래스 및 클래스의 세트 모음인 urlsession에 default를 주게되어 session은 이러한 api를 처리할 수 있는 객체가 되었다.
            let session = URLSession(configuration: .default)
            //3.Give the session a task
            //task의 역할은 지정한 URL로 가서 데이터를 가지고 다시 돌아오는 일이다.
            let task = session.dataTask(with: url) { (data, response, error) in //-> closure로 바뀐모습
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData){
                        //weathermanager를 나중에 사용하기 위해서 다른 객체들과의 묶여있는 것을 줄여야하는데 이러한 문제를 해결하기 위해서 delegate방식이다.
                        //                        let weatherVC = WeatherViewController()
                        //                        weatherVC.didUpdateWeather(weather: weather)
                        self.delegate?.didUpdateWeather(weather: weather)
                        //delegate = self를 하는 객체에게 일을 전해주는 부분이다.
                        //결국 WeatherManagerDelegate를 가지고있는 객체안에서 WeatherManager를 채택하는 객체의 delegate가 self라고 나있는 놈을 일을 시키는 구문이다. 그렇다면 결과적으로 WeatherViewController라는 객체에서 재정의 되어있는 didUpdateWeather를 실행한다는 구문이다
                        //MARK: 자꾸 햇갈리는 부분인데, init부분이 아니기떄문에 didUpdateWeather부분을 재정의 할 필요는 없다.
                        
                    } //closure안의 method에 self를 붙여준다.
                }
            }
            //init을 할 때, 파란색으로 뜰 때 enter를 누르면 trailing closure로 바뀐다.
            //let task = session.dataTalk(with: url, completionHandler: handler(data: response: error: )) -> closure를 쓰지않은 모습
            task.resume()
            //URLSession으로 Networking이 끝난다음, task가 끝나고 completionHandler를 실행하게된다.
        }
    }
    //func handler(data: Data?, response: URLResponse?, error: Error?) {
    //           if error != nil {
    //    print(error!)
    //    return
    //}
    //
    //if let safeData = data {
    //    let dataString = String(data: safeData, encoding: .utf8)
    //    print(dataString)
    //}
    //}
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id //JSON의 계층구조와 동일하게 struct와 property를 구조화시킴
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return weather
            //            print(weather.temperatureString) //weatherCondition을 가지기 위해 weathermodel안의 method를 부르는 것보다는 연산 프로퍼티를 하나 만드는 것이 더 효율적이다.
        } catch {
            print(error)
            return nil //위에 try가 실행되고 나서 아무것도 안나오게 되면 catch부분으로 들어오게 되는데 error이기 때문에 return nil을 해주고 return data type도 뒤에 "?"을 붙여준다.
        }
        //dataType을 Decodable를 넣어줘야한다.
        //decode method는 에러가 생기면 throw를 통해 error를 던져줘야한다. 그래서 error handling을 꼭 해줘야한다.
        //do block안에서 try를 통해서 decode를 실행하고, error가 발생하면 catch에서 받아서 error를 반환한다.
    }
}
