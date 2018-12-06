
import UIKit

class CitiesTableViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityTableViewCell else {
            fatalError("The dequeued cell is not an instance of CityTableViewCell.")
        }
        
        cell.cityLabel.text = "Rotem"

        return cell
    }
    
}
