import Foundation
import Combine

public protocol NetworkService {
    var networkController: any Fetchworking { get }
    var host: any HostType { get }
}

public protocol AsyncNetworkService {
    var networkController: any AsyncFetchworking { get }
    var host: any HostType { get }
}

public protocol ServiceContainer: AnyObject {
    var host: any HostType { get }
}

public protocol HostType: RawRepresentable where RawValue == String { }
