import Foundation

public struct Endpoint {
    public static var host: String = ""

    var path: String
    var body: Data? = nil
    var queryItems: [URLQueryItem] = []

    public init(path: String, body: Data? = nil, queryItems: [URLQueryItem] = []) {
        self.path = path
        self.body = body
        self.queryItems = queryItems
    }
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

    static func makeJSON<T: Encodable>(_ model: T) -> Data {
        guard let json = try? JSONEncoder().encode(model) else {
            preconditionFailure("Encoding error.")
        }

        return json
    }
}
