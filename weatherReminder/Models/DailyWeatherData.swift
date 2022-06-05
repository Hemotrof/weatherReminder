//
//  DailyWeatherData.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 30.05.2022.
//

import Foundation

struct DailyWeatherData: Codable {
    
    let dailyWeatherDetails: HourlyWeatherData?
    
    let temperature: Float
    let windspeed: Float
    let winddirection: Int
    let weathercode: Int
    

//    init?(currentWeatherData: HourlyWeatherData) {
//        temperature = currentWeatherData.hourly.
//        windspeed = currentWeatherData.current_weather.windspeed
//        winddirection = currentWeatherData.current_weather.winddirection
//        weathercode = currentWeatherData.current_weather.weathercode
//    }
    
    
}
