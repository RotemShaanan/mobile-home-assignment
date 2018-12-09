
class Temperature {
    var value: Double?
    var units: TemperatureUnits?
        
    init?(dictionary: [String: Any]?) {
        guard let dictionary = dictionary else {
            return nil
        }
        
        self.value = dictionary["value"] as? Double
        self.units = TemperatureUnits(rawValue: dictionary["units"] as! String)
    }
}
