
class Country {
    var name: String? = ""
    var capitalCity: String? = ""
    var flagImageUrl: String? = ""
    
    init?(data: Any) {
        guard let data = data as? [String: Any] else {
            return nil
        }
        
        name = data["name"] as? String
        capitalCity = data["capital"] as? String
        flagImageUrl = data["flag"] as? String
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
