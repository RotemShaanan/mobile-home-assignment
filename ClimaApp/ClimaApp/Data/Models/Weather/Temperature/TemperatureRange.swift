
class TemperatureRange {
    var minTemperature: Temperature?
    var maxTemperature: Temperature?
    var observationTime: ObservationTime?
    
    init(dictionary: [String: Any]) {
        
        self.minTemperature = Temperature(dictionary: dictionary["min"] as? [String: Any])
        self.maxTemperature = Temperature(dictionary: dictionary["max"] as? [String: Any])
        self.observationTime = ObservationTime(time: dictionary["observation_time"] as? String)
    }
}
