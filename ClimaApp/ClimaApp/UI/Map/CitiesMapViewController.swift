
import UIKit
import MapKit

class CitiesMapViewController: UIViewController, MKMapViewDelegate, CountriesPresenterProtocol {

    @IBOutlet weak var mapView: MKMapView!
    
    var countries: [Country]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
    }
    
    private func prepareMap() {
        guard let countries = self.countries else {
            return
        }
        
        if self.mapView?.annotations != nil {
            self.mapView.removeAnnotations(self.mapView.annotations)
        }
        
        for country in countries {
            if let title = country.capitalCity, let latitude = country.latitude, let longitude = country.longitude {
                self.mapView.addAnnotation(MapPin(title: title, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)))
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let mapPin = view.annotation as! MapPin
        
        let cityDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "CityDetails") as! CityDetailsViewController
        cityDetailsVC.setDetails(latitude: mapPin.coordinate.latitude, longitude: mapPin.coordinate.longitude, city: mapPin.title)
        self.navigationController?.pushViewController(cityDetailsVC , animated: true)
    }
    
    // MARK: - CountriesPresenterProtocol
    
    func countriesResultRecieved(countriesResult: [Country]) {
        self.countries = countriesResult
        
        self.prepareMap()
    }
}
