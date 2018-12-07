
class RangeIndex {
    var temperaturesRange = [TemperatureRange]()
    var precipitationsRange = [PrecipitationRange]()
    var observationTime: ObservationTime?
    
    init(dictionary: [String: Any]) {
        
        if let temps = dictionary["temp"] as? [[String : Any]] {
            for temp in temps {
                self.temperaturesRange.append(TemperatureRange(dictionary: temp))
            }
        }

        
        if let precs = dictionary["precipitation"] as? [[String : Any]] {
            for prec in precs {
                self.precipitationsRange.append(PrecipitationRange(dictionary: prec))
            }
        }

        self.observationTime = ObservationTime(dictionary: dictionary["observation_time"] as? [String: Any])
    }
}
