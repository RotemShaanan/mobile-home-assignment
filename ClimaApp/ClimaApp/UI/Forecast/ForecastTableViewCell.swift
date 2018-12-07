
import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    
    func setForecastDetails(rangeIndex: RangeIndex) {
        self.dayLabel.text = rangeIndex.observationTime?.time
        self.temperatureLabel.text = rangeIndex.getTemperatureRangeAsString()
        self.precipitationLabel.text = rangeIndex.getPrecipitationAsString()
    }
}
