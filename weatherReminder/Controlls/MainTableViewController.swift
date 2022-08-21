//
//  MainTableViewController.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 06.08.2022.
//

import UIKit

class MainTableViewController: UITableViewController, SearchLocationViewDelegate {
        

    var currentWeather: Weather?
    
    var networkManager = NetworkManager()

    let defaultLatitude = "51.50"
    let defaultLongitude = "-0.11"
    let defaultName = "London"


    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.fetchWeather(latitude: defaultLatitude, longitude: defaultLongitude)
        networkManager.onCompletion = { weather in
            self.currentWeather = weather
        }

        self.fillLocation(latitude: defaultLatitude, longitude: defaultLongitude, name: "String")

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      // #warning Incomplete implementation, return the number of sections
      return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = TodayWeatherCell()
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "todayWeatherCell", for: indexPath) as! TodayWeatherCell
            cell.backgroundColor = .red
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todayWeatherCell", for: indexPath) as! TodayWeatherCell
        return cell
        
        
    }
    

    
}
    

extension MainTableViewController {
 
    func fillLocation (latitude: String, longitude: String, name: String) {
        
        networkManager.fetchWeather(latitude: latitude, longitude: longitude)
        networkManager.onCompletion = {weather in
            self.currentWeather = weather
        }
    }
    
}

