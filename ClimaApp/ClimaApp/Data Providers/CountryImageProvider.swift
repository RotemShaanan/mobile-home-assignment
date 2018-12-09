
class CountryImageProvider {
    
    static func getCountryImage(countryCode: String) -> String {
        return CountryImageQueryBuilder.getCountryImageUrl(countryCode: countryCode)
    }
}
