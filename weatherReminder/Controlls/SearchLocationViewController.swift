//
//  SearchLocationViewController.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 12.05.2022.
//

import UIKit
import MapKit

protocol SearchLocationViewDelegate {
    func fillLocation (latitude: String, longitude: String, name: String)
}

class SearchLocationViewController: UIViewController, UISearchBarDelegate, MKLocalSearchCompleterDelegate {
    
    
    var delegate: SearchLocationViewDelegate?
    
    var location: String = ""
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchResultsTable: UITableView!
    
    
    // Create a seach completer object
    var searchCompleter = MKLocalSearchCompleter()

    // These are the results that are returned from the searchCompleter & what we are displaying
    // on the searchResultsTable
    var searchResults = [MKLocalSearchCompletion]()
    
    // This method declares that whenever the text in the searchbar is change to also update
    // the query that the searchCompleter will search based off of
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCompleter.queryFragment = searchText
    }
    
    // This method declares gets called whenever the searchCompleter has new search results
    // If you wanted to do any filter of the locations that are displayed on the the table view
    // this would be the place to do it.
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        // Setting our searcResults variable to the results that the searchCompleter returned
        searchResults = completer.results

        // Reload the tableview with our new searchResults
        searchResultsTable.reloadData()
    }

    // This method is called when there was an error with the searchCompleter
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        // Error
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchCompleter.delegate = self
        searchBar?.delegate = self
        searchResultsTable?.delegate = self
        searchResultsTable?.dataSource = self
    }

}

// Setting up extensions for the table view
extension SearchLocationViewController: UITableViewDataSource {
    // This method declares the number of sections that we want in our table.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // This method declares how many rows are the in the table
    // We want this to be the number of current search results that the
    // searchCompleter has generated for us
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    // This method delcares the cells that are table is going to show at a particular index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get the specific searchResult at the particular index
        let searchResult = searchResults[indexPath.row]

        //Create  a new UITableViewCell object
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)

        //Set the content of the cell to our searchResult data
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.subtitle

        return cell
    }
}


extension SearchLocationViewController: UITableViewDelegate {
    // This method declares the behavior of what is to happen when the row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let result = searchResults[indexPath.row]
        let searchRequest = MKLocalSearch.Request(completion: result)

        let search = MKLocalSearch(request: searchRequest)
        search.start { [self] (response, error) in
            guard let coordinate = response?.mapItems[0].placemark.coordinate else {
                return
            }

            guard let name = response?.mapItems[0].name else {
                return
            }

            main_latitude = String(coordinate.latitude)
            main_longitude = String(coordinate.longitude)
            

            delegate?.fillLocation(latitude: main_latitude, longitude: main_longitude, name: name)
            self.dismiss(animated: true, completion: nil)

        }
    }
}
