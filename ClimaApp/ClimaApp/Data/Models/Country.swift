
class Country {
    var name: String?
    var capitalCity: String?
    var countryCode: String?
    var latitude: Double?
    var longitude: Double?
    private var flagImageUrl: String?

    init?(data: Any) {
        guard let data = data as? [String: Any] else {
            return nil
        }
        
        self.name = data["name"] as? String
        self.capitalCity = data["capital"] as? String
        self.countryCode = data["alpha2Code"] as? String

        if let latlng = data["latlng"] as? [Double], latlng.count == 2 {
            latitude = latlng[0]
            longitude = latlng[1]
        }
    }
    
    func getFlagImageUrl() -> String? {
        guard let countryCode = self.countryCode else {
            return nil
        }
        
        return CountryImageProvider.getCountryImageUrl(countryCode: countryCode)
    }
    
    func getCapitalCityDescription() -> String {

        guard let name = name, let capitalCity = capitalCity else {
            return ""
        }
        
        if capitalCity == "" {
            return name
        }

        return "\(capitalCity), \((name))"
    }
}
