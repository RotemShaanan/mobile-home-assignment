
class PrecipitationRange {
    var minPrecipitation: Precipitation?
    var maxPrecipitation: Precipitation?
    var observationTime: ObservationTime?
    
    init(dictionary: [String: Any]) {
        
        self.minPrecipitation = Precipitation(dictionary: dictionary["min"] as? [String: Any])
        self.maxPrecipitation = Precipitation(dictionary: dictionary["max"] as? [String: Any])
        self.observationTime = ObservationTime(time: dictionary["observation_time"] as? String)
    }
}
