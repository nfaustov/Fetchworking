import Foundation

@propertyWrapper
public struct Inject<ServiceType: NetworkService> {
    public var wrappedValue: ServiceType
    
    public init() {
        let mirror = Mirror(reflecting: ServiceContainer.self)
        
        guard let service = mirror.children.first(where: { $0.value is ServiceType }) as? ServiceType else {
            fatalError("Cannot find service: \(ServiceType.self)")
        }
        
        wrappedValue = service
    }
}
