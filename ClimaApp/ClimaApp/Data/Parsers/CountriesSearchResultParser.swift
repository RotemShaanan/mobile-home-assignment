
class CountriesSearchResultParser {
    
    static func getCountries(countries: [Any]) -> [Country] {
        
        var countriesResult = [Country]()
        var populatedCountry: Country?
        
        for country in countries {
            populatedCountry = Country(data: country)
            
            if let populatedCountry = populatedCountry {
                countriesResult.append(populatedCountry)
            }
        }
        
        return countriesResult
    }
}
