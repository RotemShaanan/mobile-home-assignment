
class Precipitation {
    var value: Double?
    var units: PrecipitationUnits?
        
    init?(dictionary: [String: Any]?) {
        guard let dictionary = dictionary else {
            return nil
        }
        
        self.value = dictionary["value"] as? Double
        self.units = PrecipitationUnits(rawValue: dictionary["units"] as! String)
    }
}
