
class ForecastProvider {
    
    static func getForcast(latitude: Double, longitude: Double, tempUnit: TemperatureUnits = .C, completion: @escaping (_ forecast: Forecast) -> Void) {
            guard let url = ForecastRequestQueryBuilder.getForcastURL() else {
            return
        }
        
        let params = ForecastRequestQueryBuilder.getForcastParams(latitude: latitude, longitude: longitude, tempUnit: tempUnit);
        
        ApiRequestExecuter.apiRequest(url: url, params: params, completion: {(result: Any) -> Void in
            if let forecastObject = result as? [String: Any] {
                let forecast = Forecast(dictionary: forecastObject)
                completion(forecast)
            }
        })
    }
}
