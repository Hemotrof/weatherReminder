//
//  MainTableViewController.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 06.08.2022.
//

import UIKit

class MainTableViewController: UITableViewController, SearchLocationViewDelegate {
    
   
    func fillLocation (latitude: String, longitude: String, name: String) {
        
//        locationLabel.text = name
        
        networkManager.fetchWeather(latitude: latitude, longitude: longitude)
        networkManager.onCompletion = {weather in
            self.currentWeather = weather
        }
        
    }
    
    var networkManager = NetworkManager()
    
    let defaultLatitude = "51.50"
    let defaultLongitude = "-0.11"
    let defaultName = "London"
    
    var currentWeather: Weather?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        networkManager.fetchWeather(latitude: defaultLatitude, longitude: defaultLongitude)
        networkManager.onCompletion = { [weak self] weather in
            guard let self = self else { return }
            self.currentWeather = weather
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        switch indexPath.row {
            case 0:
            let draftCell = tableView.dequeueReusableCell(withIdentifier: "todayWeatherCell", for: indexPath) as! TodayWeatherCell
            draftCell.currentTemperatureLabel.text = "Hello"
//            draftCell.currentTemperatureLabel.text = String(currentWeather!.current_temperature!)
//            cell.currentHumidityLabel.text = String(currentWeather.hourly_relativeHumidity!)
            cell = draftCell
        default:
            print("err")
        }

    
        return cell
    }
    

}
