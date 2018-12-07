
class Forecast {
    var realTime: ExactIndex?
    var hourly: [ExactIndex] = [ExactIndex]()
    var daily: [RangeIndex] = [RangeIndex]()
    var nowCast: [ExactIndex] = [ExactIndex]()

    init(dictionary: [String: Any]) {
        
        self.realTime = ExactIndex(dictionary: dictionary["realtime"] as! [String: Any])
        
        if let hours = dictionary["hourly"] as? [[String: Any]] {
            for hour in hours {
                self.hourly.append(ExactIndex(dictionary: hour))
            }
        }
        
        if let days = dictionary["daily"] as? [[String: Any]] {
            for day in days {
                self.daily.append(RangeIndex(dictionary: day))
            }
        }
        
        if let minutes = dictionary["nowcast"] as? [[String: Any]] {
            for minute in minutes {
                self.nowCast.append(ExactIndex(dictionary: minute))
            }
        }
    }
}
