
class ObservationTime {
    let time: String?
    
    init(time: String?) {
        self.time = time
    }
    
    init?(dictionary: [String: Any]?) {
        guard let dictionary = dictionary else {
            return nil
        }

        self.time = dictionary["value"] as? String
    }
}
