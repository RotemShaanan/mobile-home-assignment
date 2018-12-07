
import UIKit
import SDWebImage

class CitiesTableViewController: UITableViewController {
    
    var countries: [Country]?
    
    func countriesResultRecieved(countriesResult: [Country]) -> Void {
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
        

        cell.cityLabel.text = country.getCapitalCityDescription()
        
        if let imageUrlString = country.flagImageUrl {
            if let imageUrl = URLConverter.getStringAsUrl(imageUrlString) {
                cell.flagImageView?.sd_setImage(with: imageUrl, completed: { (image: UIImage?, error: Error?, cache: SDImageCacheType, url: URL?) in
                    self.tableView.reloadRows(at: [indexPath], with: .none)
                })
            }
        }
        
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
        
        cityDetailsVC.setLatLong(latitude: latitude, longitude: longitude)
        
        self.navigationController?.pushViewController(cityDetailsVC , animated: true)
    }
}
