
import Foundation

class ForecastRequestQueryBuilder {

    private static let baseURL: String = "api2.climacell.co/v2"
    private static let forecast: String = "/weather/forecast"
    private static let tokenParamName: String = "apikey"
    private static let tokenParamValue: String = "mFW54hIC4r5puNkKBrcfQ3Xy3dqFYXCJ"
    
    private static let latitudeParamName: String = "lat"
    private static let longitudeParamName: String = "lon"
    private static let generalUnitParamName: String = "units"
    private static let tempUnitParamName: String = "temp"
    private static let fieldsParamName: String = "fields"
    private static let fieldsRequested: String = "temp,precipitation"

    static func getForcastURL() -> URL? {
        let url = "\(QueryBuilder.prefixProtocol)\(baseURL)\(forecast)"
        return URLConverter.getStringAsUrl(url)
    }
    
    static func getForcastParams(latitude: Double, longitude: Double, tempUnit: TemperatureUnits) -> [String: String] {
        return [tokenParamName: tokenParamValue,
                latitudeParamName: String(format: "%.2f", latitude),
                longitudeParamName: String(format: "%.2f", longitude),
                generalUnitParamName: "\(tempUnitParamName):\(tempUnit.rawValue)",
                fieldsParamName: fieldsRequested]
    }
}
