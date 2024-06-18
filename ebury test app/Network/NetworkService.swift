import Foundation
import Combine

final class NetworkService {
    static let shared = NetworkService()
    private let baseURL = "http://test-api-nextjs.vercel.app/api"
    
    private init() {}
    
    private func makeRequest(endpoint: String, method: String, body: [String: Any]? = nil) -> AnyPublisher<Data, Error> {
        guard let url = URL(string: "\(baseURL)\(endpoint)") else {
            return Fail(error: CustomError.invalidURL(url: "\(baseURL)\(endpoint)")).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        if let body = body {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                return Fail(error: error).eraseToAnyPublisher()
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw CustomError.invalidResponse(statusCode: 0)
                }
                
                guard httpResponse.statusCode == 200 else {
                    throw CustomError.invalidResponse(statusCode: httpResponse.statusCode)
                }
                
                return data
            }
            .eraseToAnyPublisher()
    }

    
    func fetchTransactions() -> AnyPublisher<[TransactionsModel], Error> {
        return makeRequest(endpoint: "/transactions", method: "GET")
            .decode(type: [TransactionsModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
