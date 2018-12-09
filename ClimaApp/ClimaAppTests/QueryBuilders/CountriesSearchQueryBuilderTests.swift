
import XCTest
@testable import ClimaApp

class CountriesSearchQueryBuilderTests: XCTestCase {
    
    func testGetAllCountriesURL_returnCorrectUrl() {
        let result = CountriesSearchQueryBuilder.getAllCountriesURL()
        
        XCTAssertEqual(result?.absoluteString, "https://restcountries.eu/rest/v2/all")
    }
    
    func testGetCitySearchURL_returnCorrectUrl() {
        let result = CountriesSearchQueryBuilder.getCitySearchURL(city: "city")
        
        XCTAssertEqual(result?.absoluteString, "https://restcountries.eu/rest/v2/capital/city")
    }
}
