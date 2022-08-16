//
//  ViewController.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 06.05.2022.
//

import UIKit


class MainViewController: UIViewController, SearchLocationViewDelegate {
    
    var networkManager = NetworkManager()
    
    @IBOutlet weak var todayView: UIView!

    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    

    
    let defaultLatitude = "51.50"
    let defaultLongitude = "-0.11"
    let defaultName = "London"
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "image 8")!)
//        self.scrollView.backgroundColor = nil

        
        todayView.layer.cornerRadius = 16
//        weekTableView.layer.cornerRadius = 16
        todayView.backgroundColor = nil
        
        
        let blurView = UIVisualEffectView()
        blurView.effect = UIBlurEffect(style: .light)
        blurView.frame = todayView.bounds
        blurView.layer.cornerRadius = 16
        blurView.clipsToBounds = true

        todayView.addSubview(blurView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchLocationSegue" {
            let destinationSV = segue.destination as! SearchLocationViewController
            destinationSV.delegate = self
        }
    }
    
    func fillLocation (latitude: String, longitude: String, name: String) {
//        locationLabel.text = name
        
        networkManager.fetchWeather(latitude: latitude, longitude: longitude)
        networkManager.onCompletion = { [weak self] weather in
            guard let self = self else { return }
            weather_forecast = weather
            self.updateCurrentWeather(fromWeather: weather)
        }
        
    }
    
    func updateCurrentWeather (fromWeather weather: Weather) {
        DispatchQueue.main.async {
            self.windLabel.text = String(weather.current_windspeed!)
            self.temperatureLabel.text = String(weather.current_temperature!)
        }
        
    }

    
}

