
import XCTest
@testable import ClimaApp

class CountryTests: XCTestCase {
    
    func testGetCapitalCityDescription_whenNoNameNorCapital_returnEmptyString() {
        let data = [String: Any]()
        
        let target = Country(data: data)
        let result = target?.getCapitalCityDescription()
        
        XCTAssertEqual(result, "")
    }
    
    func testGetCapitalCityDescription_whenEmptyCapitalCity_returnName() {
        let data = ["name": "country",
                    "capital": ""]

        let target = Country(data: data)
        let result = target?.getCapitalCityDescription()
        
        XCTAssertEqual(result, "country")
    }
    
    func testGetCapitalCityDescription_whenValuesExist_returnCapitalAndName() {
        let data = ["name": "country",
                    "capital": "capital"]

        let target = Country(data: data)
        let result = target?.getCapitalCityDescription()
        
        XCTAssertEqual(result, "capital, country")
    }
}
