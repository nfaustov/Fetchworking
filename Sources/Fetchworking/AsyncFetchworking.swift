import Foundation

public protocol AsyncFetchworking: AnyObject {
    func request<T: Decodable>(method: HttpMethod, endpoint: Endpoint) async throws -> T
}
