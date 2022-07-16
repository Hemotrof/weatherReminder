//
//  ViewController.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 06.05.2022.
//

import UIKit


class MainViewController: UIViewController, SearchLocationViewDelegate {
    
    var networkManager = NetworkManager()
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pageCounter: UIPageControl!
    
    
    let defaultLatitude = 51.50
    let defaultLongitude = -0.11
    let defaultName = "London"
    
    override func viewDidLoad() {
        self.fillLocation(latitude: Float(defaultLatitude),
                                        longitude: Float(defaultLongitude),
                                        name: defaultName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchLocationSegue" {
            let destinationSV = segue.destination as! SearchLocationViewController
            destinationSV.delegate = self
        }
    }
    
    func fillLocation (latitude: Float, longitude: Float, name: String) {
        locationLabel.text = name
        
        networkManager.fetchCurrentWeather(latitude: latitude, longitude: longitude)
        networkManager.onCompletion = { [weak self] weather in
            guard let self = self else { return }
            self.updateCurrentWeather(fromWeather: weather)
        }
        
    }
    
    func updateCurrentWeather (fromWeather weather: Weather) {
        DispatchQueue.main.async {
            self.windLabel.text = String(weather.windspeed!)
            self.temperatureLabel.text = String(weather.temperature!)
        }
        
    }

    
}

