import Foundation
import Combine

public protocol Fetchworking: AnyObject {
    func request<T: Codable>(method: HttpMethod, endpoint: Endpoint) -> AnyPublisher<T, Error>
}

public enum HttpMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}
