
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
    
    func getTemperatureRangeAsString() -> String {
        
        guard let unit = self.temperaturesRange[0].minTemperature?.units?.rawValue else {
            return ""
        }
    
        var minTemp: Double = 999
        var maxTemp: Double = -999
        
        for temp in self.temperaturesRange {
            
            if let minValue = temp.minTemperature?.value {
                minTemp = min(minTemp, minValue)
            }
            
            if let maxValue = temp.maxTemperature?.value {
                maxTemp = max(minTemp, maxValue)
            }
        }
                
        let minString = String(format: "%.2f", minTemp)
        let maxString = String(format: "%.2f", maxTemp)
        return "\(minString) - \(maxString) \(unit)"
    }
    
    func getPrecipitationAsString() -> String {
        
        guard let unit = self.precipitationsRange[0].maxPrecipitation?.units?.rawValue else {
            return ""
        }
        
        var value: Double = -999

        for temp in self.temperaturesRange {
            
            if let minValue = temp.minTemperature?.value {
                value = minValue
                continue
            }
            
            if let maxValue = temp.maxTemperature?.value {
                value = maxValue
                continue
            }
        }
        
        let valueString = String(format: "%.2f", value)
        return "\(valueString) \(unit)"
    }

}
