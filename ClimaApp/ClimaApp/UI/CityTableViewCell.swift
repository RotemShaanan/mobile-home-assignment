
import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
 
    func setCell(country: Country) -> Void {
//        self.cityLabel.text = country.getCapitalCityDescription()
//        
//        if let imageUrlString = country.flagImageUrl {
//            if let imageUrl = URLConverter.getStringAsUrl(imageUrlString) {
//                self.productImageView?.sd_setImage(with: imageUrl, completed: { (image: UIImage?, error: Error?, cache: SDImageCacheType, url: URL?) in
//                    self.tableView.reloadRows(at: [indexPath], with: .none)
//                })
//            }
//        }

    }
}
