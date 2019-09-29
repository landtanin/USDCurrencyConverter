import Alamofire

public class USDCurrencyConverter {
    
    private var url = URL(string: "http://apilayer.net/api/live?")
    private var apiKey: String
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public convertUSDTo(currency: Currency) -> Data? {
        
        Alamofire.request(
            url, method: .get,
            parameters: ["access_key":apiKey,
                         "currencies":Currency.self,
                         "format":"1"]
        ).response { [weak self] (response) in
            return response.data
        }
        
    }
    
}
