import Foundation
import Combine

// Define a final class NetworkService for managing network requests
final class NetworkService {
    // Create a shared singleton instance of NetworkService
    static let shared = NetworkService()
    // Define the base URL for the API
    private let baseURL = "http://test-api-nextjs.vercel.app/api"
    
    // Private initializer to ensure the singleton pattern
    private init() {}
    
    // Private method to create and send a network request
    private func makeRequest(endpoint: String, method: String, body: [String: Any]? = nil) -> AnyPublisher<Data, Error> {
        // Ensure the URL is valid, otherwise return a failure publisher
        guard let url = URL(string: "\(baseURL)\(endpoint)") else {
            return Fail(error: CustomError.invalidURL(url: "\(baseURL)\(endpoint)")).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url) // Create a URL request with the URL
        request.httpMethod = method // Set the HTTP method (GET, POST, etc.)
        
        // If there's a body, serialize it to JSON and set the appropriate headers
        if let body = body {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                return Fail(error: error).eraseToAnyPublisher() // Return a failure publisher if serialization fails
            }
        }
        
        // Use URLSession to perform the network request and handle the response
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                // Ensure the response is an HTTP response and check the status code
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw CustomError.invalidResponse(statusCode: 0)
                }
                
                guard httpResponse.statusCode == 200 else {
                    throw CustomError.invalidResponse(statusCode: httpResponse.statusCode)
                }
                
                return data // Return the data if the response is valid
            }
            .eraseToAnyPublisher()
    }

    // Public method to fetch transactions, returning a publisher of an array of TransactionsModel
    func fetchTransactions() -> AnyPublisher<[TransactionsModel], Error> {
        return makeRequest(endpoint: "/transactions", method: "GET")
            .decode(type: [TransactionsModel].self, decoder: JSONDecoder()) // Decode the JSON response into an array of TransactionsModel
            .eraseToAnyPublisher()
    }
}
