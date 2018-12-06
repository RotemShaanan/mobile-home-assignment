
import Alamofire

class ApiRequestExecuter {
    
    static func apiRequest(url: URL, params: Dictionary<String, String>?, completion: @escaping (_ responseData: Any) -> Void) {

        Alamofire.request(url, method: .get, parameters: params)
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success:
                    jsonFinishLoaded(response: response, completion: completion)
                case .failure(let error):
                    jsonFailed(error: error)
                }
            })
    }

    class func jsonFinishLoaded(response: DataResponse<Any>?, completion: (_ responseData: Any) -> Void) {

        if let data = response?.data,
            let json = try? JSONSerialization.jsonObject(with: data) {
            completion(json)
        }
    }

    class func jsonFailed(error: Error?) {
        print(error?.localizedDescription ?? "Unknown error")
    }
}
