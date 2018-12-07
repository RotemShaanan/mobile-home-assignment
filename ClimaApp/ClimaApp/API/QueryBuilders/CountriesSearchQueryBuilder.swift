
import Foundation

class CountriesSearchQueryBuilder {
    
    private static let baseURL: String = "restcountries.eu/rest/v2/"
    private static let allParam: String = "all"
    private static let cityParam: String = "capital"

    static func getAllCountriesURL() -> URL? {
        let url = "\(QueryBuilder.prefixProtocol)\(baseURL)\(allParam)"
        return URLConverter.getStringAsUrl(url)
    }
    
    static func getCitySearchURL(city: String) -> URL? {
        let url = "\(QueryBuilder.prefixProtocol)\(baseURL)\(cityParam)/\(city)"
        return URLConverter.getStringAsUrl(url)
    }
}
