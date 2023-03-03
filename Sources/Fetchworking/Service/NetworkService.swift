import Foundation

public protocol NetworkService {
    var networkController: any Fetchworking { get }
}

public protocol AsyncNetworkService {
    var networkController: any AsyncFetchworking { get }
}

