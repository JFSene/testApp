import Foundation

enum CustomError: Error {
    case invalidURL(url: String)
    case invalidResponse(statusCode: Int)
    case invalidData
    case unauthorized
}
