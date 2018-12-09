
class CountryImageProvider {
    
    static func getCountryImageUrl(countryCode: String) -> String {
        return CountryImageQueryBuilder.getCountryImageUrl(countryCode: countryCode)
    }
}
