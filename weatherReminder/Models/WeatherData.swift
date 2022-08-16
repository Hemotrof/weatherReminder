//
//  Weather.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 25.05.2022.
//

import Foundation

struct WeatherData: Codable {
    
    let currentWeather: CurrentWeather?
    let hourlyWeather: HourlyWeather?
    
    enum CodingKeys: String, CodingKey {
        case currentWeather = "current_weather"
        case hourlyWeather = "hourly"
    }
}

struct CurrentWeather: Codable {
    
    let temperature: Float
    let windspeed: Float
    let winddirection: Float
    let weathercode: Float
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temperature"
        case windspeed = "windspeed"
        case winddirection = "winddirection"
        case weathercode = "weathercode"
    }
}

struct HourlyWeather: Codable {
    
    let temperature: [Float]
    let relativeHumidity: [Float]
    let precipitation: [Float]
    let windDirection: [Float]
    let cloudcover: [Float]
    let windSpeed: [Float]
    let apparentTemperature: [Float]
    let weatherCode: [Float]
    let time: [String]
    
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temperature_2m"
        case relativeHumidity = "relativehumidity_2m"
        case precipitation = "precipitation"
        case windDirection = "winddirection_10m"
        case cloudcover = "cloudcover"
        case windSpeed = "windspeed_10m"
        case apparentTemperature = "apparent_temperature"
        case weatherCode = "weathercode"
        case time = "time"
        }
    
}

struct hourlyUnits: Codable{
    
    var temperature = "°C"
    var relativeHumidity = "%"
    var precipitation = "mm"
    var windDirection = "°"
    var cloudcover = "%"
    var windSpeed = "km/h"
    var apparentTemperature = "°C"
    var time = "iso8601"
    
}

    
