
import UIKit
import MapKit

let MapInitialRadius: Double = 1000000

class CityDetailsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var latitude: Double?
    var longitude: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let latitude = self.latitude, let longitude = self.longitude else {
            return
        }
        
        let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
        centerMap(location: initialLocation)
    }
    
    func centerMap(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: MapInitialRadius, longitudinalMeters: MapInitialRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setLatLong(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        if let latitude = self.latitude, let longitude = self.longitude {
            ForecastProvider.getForcast(latitude: latitude, longitude: longitude) { (country) in
                
            }
        }
    }
}
