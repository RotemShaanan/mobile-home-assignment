
import UIKit
import MapKit

let MapInitialRadius: Double = 1000000

class CityDetailsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var forecastTableViewController: ForecastTableViewController?

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let controller = segue.destination as? ForecastTableViewController {
            self.forecastTableViewController = controller
        }
    }
    
    func centerMap(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: MapInitialRadius, longitudinalMeters: MapInitialRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func setLatLong(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let latitude = self.latitude, let longitude = self.longitude {
            ForecastProvider.getForcast(latitude: latitude, longitude: longitude) { (forecast) in
                self.forecastTableViewController?.forecastResultRecieved(dailyForecastResult: forecast.daily)
            }
        }
    }
}
