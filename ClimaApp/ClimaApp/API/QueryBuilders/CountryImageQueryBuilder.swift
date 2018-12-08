
class CountryImageQueryBuilder {
    
    private static let baseURL: String = "www.countryflags.io/"
    private static let ImageParams: String = "flat/64.png"
    
    static func getCountryImageUrl(countryCode: String) -> String {
        return "\(QueryBuilder.prefixProtocol)\(baseURL)\(countryCode)/\(ImageParams)"
    }
}
