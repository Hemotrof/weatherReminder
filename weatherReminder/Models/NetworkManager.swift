//
//  NetworkManager.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 15.05.2022.
//

import Foundation

class NetworkManager {
    
    var onCompletion: ((Weather) -> Void)?
    
    func fetchWeather(latitude: String, longitude: String) {
        
        var urlComponents = URLComponents(string: baseUrl)!
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        queryItems.append(URLQueryItem(name: "latitude", value: latitude))
        queryItems.append(URLQueryItem(name: "longitude", value: longitude))
        
        queryItems.append(URLQueryItem(name: "hourly", value: "temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,weathercode,cloudcover,windspeed_10m,winddirection_10m"))
        
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
                    guard let weather_n = Weather(weather: weatherData) else {
                        return nil
                    }
                    return weather_n
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                return nil
        
    }

}
