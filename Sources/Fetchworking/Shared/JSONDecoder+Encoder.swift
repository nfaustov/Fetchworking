import Foundation

extension JSONDecoder {
    static let shared: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
}

extension JSONEncoder {
    static let shared: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return encoder
    }()
}
