
class Country {
    var name: String?
    var capitalCity: String?
    var flagImageUrl: String?
    var latitude: Double?
    var longitude: Double?

    init?(data: Any) {
        guard let data = data as? [String: Any] else {
            return nil
        }
        
        name = data["name"] as? String
        capitalCity = data["capital"] as? String
        flagImageUrl = "https://camo.githubusercontent.com/664cd119251666da834640ecc00619376940409e/68747470733a2f2f73312e7069712e6c616e642f323031362f30332f30382f6a356453333346444f57426431586f7236314a7743614c375f343030783430302e706e67" //data["flag"] as? String
        
        if let latlng = data["latlng"] as? [Double], latlng.count == 2{
            latitude = latlng[0]
            longitude = latlng[1]
        }
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
