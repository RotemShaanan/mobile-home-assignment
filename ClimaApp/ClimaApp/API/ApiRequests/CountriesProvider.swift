
import Foundation

class CountriesProvider {
    
    static func getCountryByCapitalName(searchTerm: String?, completion: @escaping (_ countriesResult: [Country]) -> Void) {
        
        guard let searchTerm = (searchTerm != nil && !(searchTerm?.isEmpty)!) ? searchTerm : nil else {
            return
        }
        
        guard let url = CountriesSearchQueryBuilder.getCitySearchURL(city: searchTerm) else {
            return
        }
        
        executeApiRequest(url: url, params: nil, completion: completion)
    }
    
    static func getAllCountries(completion: @escaping (_ countriesResult: [Country]) -> Void) {
        
        guard let url = CountriesSearchQueryBuilder.getAllCountriesURL() else {
            return
        }
        
        executeApiRequest(url: url, params: nil, completion: completion)
    }
    
    private static func executeApiRequest(url: URL, params: Dictionary<String, String>?, completion: @escaping (_ countriesResult: [Country]) -> Void) {
        ApiRequestExecuter.apiRequest(url: url, params: nil, completion: {(result: Any) -> Void in
            if let countriesArray = result as? [Any] {
                let countriesResult = CountriesSearchResultParser.getCountries(countries: countriesArray)
                completion(countriesResult)
            }
        })
    }
}
