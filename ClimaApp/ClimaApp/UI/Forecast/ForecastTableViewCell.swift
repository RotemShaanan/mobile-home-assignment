
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
