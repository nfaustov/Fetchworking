import Foundation

extension NetworkController {
    func makeRequest(method: HttpMethod, endpoint: Endpoint) -> URLRequest {
        var urlRequest = URLRequest(url: endpoint.url)
        urlRequest.httpBody = endpoint.body
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = endpoint.headers

        Log.info("(\(urlRequest.httpMethod ?? "")) '\(urlRequest.url?.absoluteString ?? "")'")

        return urlRequest
    }

    func handleResponse(_ response: URLResponse) throws {
        guard let response = response as? HTTPURLResponse else {
            throw httpError(0)
        }

        Log.info("Status code: \(response.statusCode) '\(response.url?.absoluteString ?? "")'")

        if !(200...299).contains(response.statusCode) {
            throw httpError(response.statusCode)
        }
    }

    func handleError(_ error: Error) -> NetworkRequestError {
        switch error {
        case is Swift.DecodingError:
            return .decodingError(error.localizedDescription)
        case let urlError as URLError:
            return .urlSessionFailed(urlError)
        case let error as NetworkRequestError:
            return error
        default:
            return .unknownError
        }
    }

    func httpError(_ statusCode: Int) -> NetworkRequestError {
        switch statusCode {
        case 400: return .badRequest
        case 401: return .unauthorized
        case 403: return .forbidden
        case 404: return .notFound
        case 402, 405...499: return .error4xx(statusCode)
        case 500: return .serverError
        case 501...599: return .error5xx(statusCode)
        default: return .unknownError
        }
    }
}
