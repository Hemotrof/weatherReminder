//
//  Weather.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 25.05.2022.
//

import Foundation

struct HourlyWeatherData: Codable {
    
    let currentWeather: CurrentWeather?
    let hourly: HourlyWeather?
    
    enum CodingKeys: String, CodingKey {
        case currentWeather = "current_weather"
        case hourly = "hourly"
    }
}

struct CurrentWeather: Codable {
    
    let temperature: Float
    let windspeed: Float
    let winddirection: Int
    let weathercode: Int
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temperature"
        case windspeed = "windspeed"
        case winddirection = "winddirection"
        case weathercode = "weathercode"
    }
}

struct HourlyWeather: Codable {
    
    let temperature: [Float]
    let relativeHumidity: [Int]
    let precipitation: [Float]
    let windDirection: [Int]
    let cloudcover: [Int]
    let windSpeed: [Float]
    let apparentTemperature: [Float]
    let weatherCode: [Int]
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

    
