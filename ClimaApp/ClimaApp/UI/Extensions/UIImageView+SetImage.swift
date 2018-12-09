
import UIKit
import SDWebImage

extension UIImageView {
    
    func setImage(url: String) {
        if let imageUrl = URLConverter.getStringAsUrl(url) {
            self.sd_setImage(with: imageUrl, completed: nil)
        }
    }
}
