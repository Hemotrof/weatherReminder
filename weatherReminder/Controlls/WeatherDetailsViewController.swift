//
//  WeatherDetails.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 10.05.2022.
//

import UIKit

class WeatherDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    let weatherArray: [HourlyWeatherData] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! weatherCell

        cell.timeLabel.text = "hello"
        
        return cell
    }
     
}

class weatherCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windspeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var cloudinessLabel: UILabel!
    
    
}
