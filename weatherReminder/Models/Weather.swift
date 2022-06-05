//
//  Weather.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 25.05.2022.
//

import Foundation


class Weather {
    
    let temperature: Float?
    let windspeed: Float?
    let winddirection: Int?
    let weathercode: Int?
    

    init?(currentWeather: CurrentWeather) {
                
        temperature = currentWeather.temperature
        windspeed = currentWeather.windspeed
        winddirection = currentWeather.winddirection
        weathercode = currentWeather.weathercode
    }
    
    
}
