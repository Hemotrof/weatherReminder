//
//  NetworkManager.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 15.05.2022.
//

import Foundation

class NetworkManager {
    
    var onCompletion: ((Weather) -> Void)?
    
    func fetchCurrentWeather(latitude: Float, longitude: Float) {
        
        var urlComponents = URLComponents(string: baseUrl)!
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        queryItems.append(URLQueryItem(name: "latitude", value: String(latitude)))
        queryItems.append(URLQueryItem(name: "longitude", value: String(longitude)))
        queryItems.append(URLQueryItem(name: "current_weather", value: "true"))
        urlComponents.queryItems = queryItems
            
        executeRequest(url: urlComponents.url!)
    }
    
    fileprivate func executeRequest(url: URL) {
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let data = data {
                if let weather = self.parsingJson(withData: data){
                    self.onCompletion?(weather)
                }
            }
        }
        task.resume()
    }
    
    
    func parsingJson(withData data: Data) -> Weather? {
        
        let decoder = JSONDecoder()
                do {
                    let weatherData = try decoder.decode(WeatherData.self, from: data)
                    guard let currentWeather = Weather(currentWeatherData: weatherData) else {
                        return nil
                    }
                    return currentWeather
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                return nil
        
    }

}
