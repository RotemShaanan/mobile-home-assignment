
import XCTest
@testable import ClimaApp

class CountryImageQueryBuilderTests: XCTestCase {
    
    func testGetCountryImageUrl_returnCorrectUrl() {
        let result = CountryImageQueryBuilder.getCountryImageUrl(countryCode: "code")
        
        XCTAssertEqual(result, "https://www.countryflags.io/code/flat/64.png")
    }
}
