
class ExactIndex {
    var temperature: Temperature?
    var precipitation: Precipitation?
    var observationTime: ObservationTime?
        
    init(dictionary: [String: Any]) {
        self.temperature = Temperature(dictionary: dictionary["temp"] as? [String: Any])
        self.precipitation = Precipitation(dictionary: dictionary["precipitation"] as? [String: Any])
        self.observationTime = ObservationTime(dictionary: dictionary["observation_time"] as? [String: Any])
    }
}
