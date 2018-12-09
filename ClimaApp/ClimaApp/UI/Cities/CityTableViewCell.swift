
import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!

    func setData(text: String, imageUrl: String?) {
        self.cityLabel.text = text
        
        if let imageUrlString = imageUrl {
            self.flagImageView?.setImage(url: imageUrlString)
        }
    }
}
