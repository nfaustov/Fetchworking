import Foundation
import Combine

extension NetworkController: Fetchworking {
    public func request<T: Decodable>(method: HttpMethod, endpoint: Endpoint) -> AnyPublisher<T, Error> {
        let urlRequest = makeRequest(method: method, endpoint: endpoint)

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ [handleResponse] data, response in
                try handleResponse(response)

                return data
            })
            .receive(on: DispatchQueue.main)
            .decode(type: T.self, decoder: decoder)
            .mapError({ [handleError] error in
                Log.error("\(error)")
                return handleError(error)
            })
            .eraseToAnyPublisher()
    }
}
