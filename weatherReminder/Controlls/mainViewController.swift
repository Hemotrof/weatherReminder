//
//  ViewController.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 06.05.2022.
//

import UIKit


class mainViewController: UIViewController, SearchLocationViewDelegate {
    
    let networkManager = NetworkManager()
     
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchLocationSegue" {
            let destinationSV = segue.destination as! SearchLocationViewController
            destinationSV.delegate = self
        }
    }
    
    func fillLocation (latitude: Float, longitude: Float, name: String) {
        navigationItem.title = name
        
        networkManager.fetchCurrentWeather(latitude: latitude, longitude: longitude)
        networkManager.onCompletion = { [weak self] weather in
            guard let self = self else { return }
            self.updateCurrentWeather(fromWeather: weather)
            
        }
        
    }
    
    
    func updateCurrentWeather (fromWeather weather: Weather) {
        
        DispatchQueue.main.async {
            self.windLabel.text = String(weather.windspeed)
            self.temperatureLabel.text = String(weather.temperature)
        }
        
    }

    
}

