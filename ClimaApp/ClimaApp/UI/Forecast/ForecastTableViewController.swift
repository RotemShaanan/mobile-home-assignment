
import UIKit

let ForecastDaysAhead: Int = 5

class ForecastTableViewController: UITableViewController {

    var dailyForecast: [RangeIndex]?
    
    func forecastResultRecieved(dailyForecastResult: [RangeIndex]) -> Void {
        self.dailyForecast = dailyForecastResult
        
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let forecast = self.dailyForecast else {
            return 0
        }
        
        return min(forecast.count, ForecastDaysAhead)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ForcastCell", for: indexPath) as? ForecastTableViewCell else {
            fatalError("The dequeued cell is not an instance of ForecastTableViewCell.")
        }

        if let day = dailyForecast?[indexPath.row] {
            cell.setForecastDetails(rangeIndex: day)
        }

        return cell
    }
}
