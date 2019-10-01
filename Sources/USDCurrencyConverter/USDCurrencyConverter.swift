import Alamofire
import Foundation

public class USDCurrencyConverter {
    
    private var apiKey: String
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func convertUSDTo(currency: Currency, completion: @escaping (Data?) -> Void) {
        
        guard let url = URL(string: "http://apilayer.net/api/live?") else {
            return
        }
        
        AF.request(
            url, method: .get,
            parameters: [
                "access_key":apiKey,
                "currencies":currency.rawValue,
                "format":"1"
            ]
        ).response { (response) in
            completion(response.data)
        }
        
    }
    
}
