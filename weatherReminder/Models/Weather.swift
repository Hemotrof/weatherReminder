//
//  Weather.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 25.05.2022.
//

import Foundation


struct Weather {
    
    let current_temperature: Float?
    let current_windspeed: Float?
    let current_winddirection: Float?
    let current_weathercode: Float?
    
    let hourly_temperature: [Float]
    let hourly_relativeHumidity: [Float]
    let hourly_precipitation: [Float]
    let hourly_windDirection: [Float]
    let hourly_cloudcover: [Float]
    let hourly_windSpeed: [Float]
    let hourly_apparentTemperature: [Float]
    let hourly_weatherCode: [Float]
    let time: [String]
    

    init?(weather: WeatherData) {
        
        guard let currentWeather = weather.currentWeather else {return nil}
        guard let hourlyWeather = weather.hourlyWeather else {return nil}
                
        current_temperature = currentWeather.temperature
        current_windspeed = currentWeather.windspeed
        current_winddirection = currentWeather.winddirection
        current_weathercode = currentWeather.weathercode
        
        hourly_temperature = hourlyWeather.temperature
        hourly_relativeHumidity = hourlyWeather.relativeHumidity
        hourly_precipitation = hourlyWeather.precipitation
        hourly_windDirection = hourlyWeather.windDirection
        hourly_cloudcover = hourlyWeather.cloudcover
        hourly_windSpeed = hourlyWeather.windSpeed
        hourly_apparentTemperature = hourlyWeather.apparentTemperature
        hourly_weatherCode = hourlyWeather.weatherCode
        time = hourlyWeather.time
    }
    
}
