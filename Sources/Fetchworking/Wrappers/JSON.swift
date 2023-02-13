import Foundation

@propertyWrapper
public struct JSON<Model: Encodable> {
    public var wrappedValue: Data

    public init(_ model: Model) {
        guard let json = try? JSONEncoder().encode(model) else {
            preconditionFailure("Encoding error.")
        }

        wrappedValue = json
    }
}
