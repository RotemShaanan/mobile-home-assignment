
protocol QueryBuilder {
    
    static func getBaseUrl() -> String
    static func getParams(searchTerm: String) -> Dictionary<String, String>

}
