import Foundation

extension NetworkController: AsyncFetchworking {
    public func request<T: Decodable>(method: HttpMethod, endpoint: Endpoint) async throws -> T {
        let urlRequest = makeRequest(method: method, endpoint: endpoint)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        try handleResponse(response, url: urlRequest.url)

        return try decoder.decode(T.self, from: data)
    }
}
