
enum TemperatureUnits :String {
    case C, F
    
    func switchMetric() -> TemperatureUnits {
        if self == .C {
            return .F
        }
        
        return .C
    }
}
