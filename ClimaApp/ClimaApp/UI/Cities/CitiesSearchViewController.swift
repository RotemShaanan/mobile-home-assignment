
import UIKit

class CitiesSearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var viewsContainer: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private var countriesTableViewController: CitiesTableViewController?
    private var countries: [Country]?

    private lazy var citiesMapViewController: CitiesMapViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "CitiesMap") as! CitiesMapViewController
        
        return viewController
    }()

    // MARK: - life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.countries == nil {
            getCountries()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let controller = segue.destination as? CitiesTableViewController {
            self.countriesTableViewController = controller
        }
    }
    
    // MARL: - actions
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        self.getCountries()
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        self.updateView()
    }
    
    // MARK: - private methods
    
    private func getCountries() {
        if let searchTerm = searchTextField.text, searchTerm != "" {
            CountriesProvider.getCountryByCapitalName(searchTerm: searchTerm, completion: { (countries) in
                self.updateCountries(countries: countries)
            })
        }
        else {
            CountriesProvider.getAllCountries(completion: { (countries) in
                self.updateCountries(countries: countries)
            })
        }
    }
    
    private func updateCountries(countries: [Country]) {
        self.countries = countries
        self.countriesTableViewController?.countriesResultRecieved(countriesResult: self.countries!)
        self.citiesMapViewController.countriesResultRecieved(countriesResult: self.countries!)
    }
    
    private func updateView() {
        
        guard let countriesTableViewController = countriesTableViewController else {
            return
        }
        
        if self.segmentedControl.selectedSegmentIndex == 0 {
            remove(childViewController: citiesMapViewController)
            add(childViewController: countriesTableViewController)

        } else {
            remove(childViewController: countriesTableViewController)
            add(childViewController: citiesMapViewController)
        }
    }
    
    private func add(childViewController: UIViewController) {
        self.addChild(childViewController)
        self.viewsContainer.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
    }

    private func remove(childViewController: UIViewController) {

        childViewController.willMove(toParent: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParent()
    }
}
