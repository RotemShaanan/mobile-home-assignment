
import UIKit

class CitiesTableViewController: UITableViewController, CountriesPresenterProtocol {
    
    var countries: [Country]?
    
    // MARK: - CountriesPresenterProtocol
    
    func countriesResultRecieved(countriesResult: [Country]) {
        self.countries = countriesResult
        
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityTableViewCell else {
            fatalError("The dequeued cell is not an instance of CityTableViewCell.")
        }
        
        guard let country = countries?[indexPath.row] else {
            return cell
        }

        cell.setData(text: country.getCapitalCityDescription(), imageUrl: country.getFlagImageUrl())
                
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cityDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "CityDetails") as! CityDetailsViewController
        
        guard let country = countries?[indexPath.row] else {
            return
        }
        
        guard let latitude = country.latitude, let longitude = country.longitude else {
            return
        }
        
        cityDetailsVC.setDetails(latitude: latitude, longitude: longitude, city: country.capitalCity)
        
        self.navigationController?.pushViewController(cityDetailsVC , animated: true)
    }
}
