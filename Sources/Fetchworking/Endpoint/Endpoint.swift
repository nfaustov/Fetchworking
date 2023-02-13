import Foundation

public struct Endpoint {
    static var host: String = ""

    var path: String
    var body: Data? = nil
    var queryItems: [URLQueryItem] = []
}

public extension Endpoint {
    var url: URL {
        var urlComponents = URLComponents()
        urlComponents.host = Endpoint.host
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            preconditionFailure("Invalid URL components: \(urlComponents)")
        }

        return url
    }

    var headers: [String: String] {
        ["Content-Type": "application/json"]
    }
}
