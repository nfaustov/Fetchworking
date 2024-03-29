import Foundation

public struct Endpoint {
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
        var urlComponents = URLComponents(string: "http://127.0.0.1:8080")
        urlComponents?.path = path
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
            preconditionFailure("Invalid URL components")
        }

        return url
    }

    var headers: [String: String] {
        ["Content-Type": "application/json"]
    }

    static func makeJSON<T: Encodable>(_ model: T) -> Data {
        guard let json = try? JSONEncoder.shared.encode(model) else {
            preconditionFailure("Encoding error.")
        }

        return json
    }
}
