
import UIKit
import MapKit

let MapInitialRadius: Double = 1000000

class CityDetailsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var forecastTableViewController: ForecastTableViewController?

    var latitude: Double?
    var longitude: Double?
    var city: String?
    var tempMetric: TemperatureUnits = .C

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = city
        self.setMap()
        self.addNavButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.getForcast(tempUnit: self.tempMetric)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let controller = segue.destination as? ForecastTableViewController {
            self.forecastTableViewController = controller
        }
    }
    
    // MARK: - Public methods
    
    func setDetails(latitude: Double, longitude: Double, city: String?) {
        self.latitude = latitude
        self.longitude = longitude
        self.city = city
    }
    
    // MARK: - Private methods
    
    private func getForcast(tempUnit: TemperatureUnits = .C) {
        if let latitude = self.latitude, let longitude = self.longitude {
            ForecastProvider.getForcast(latitude: latitude, longitude: longitude, tempUnit: tempUnit) { (forecast) in
                self.forecastTableViewController?.forecastResultRecieved(dailyForecastResult: forecast.daily)
            }
        }
    }
    
    private func centerMap(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: MapInitialRadius, longitudinalMeters: MapInitialRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
        self.mapView.addAnnotation(MapPin(title: "", coordinate: location.coordinate))
    }
    
    private func setMap() {
        guard let latitude = self.latitude, let longitude = self.longitude else {
            return
        }
        
        let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
        centerMap(location: initialLocation)
    }
    
    private func addNavButton() {
        let rightButtonItem =
            UIBarButtonItem.init(title: "Switch metric", style: .plain, target: self, action: #selector(changeMetricClicked))
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    @objc private func changeMetricClicked(sender: UIBarButtonItem) {
        self.tempMetric = self.tempMetric.switchMetric()
        self.getForcast(tempUnit: self.tempMetric)
    }
}
