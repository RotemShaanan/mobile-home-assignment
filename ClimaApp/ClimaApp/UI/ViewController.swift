
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var countriesTableView: UIView!
    
    var countriesTableViewController: CitiesTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getCountries()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let controller = segue.destination as? CitiesTableViewController {
            self.countriesTableViewController = controller
        }
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        getCountries()
    }
    
    func getCountries() {
        if let searchTerm = searchTextField.text, searchTerm != "" {
            CountriesSearcher.getCountryByCapitalName(searchTerm: searchTerm, completion: { (countries) in
                self.countriesTableViewController?.countriesResultRecieved(countriesResult: countries)
            })
        }
        else {
            CountriesSearcher.getAllCountries(completion: { (countries) in
                self.countriesTableViewController?.countriesResultRecieved(countriesResult: countries)
            })
        }
    }
}
