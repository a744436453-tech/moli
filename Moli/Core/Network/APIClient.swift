import Foundation

final class APIClient {
    static let shared = APIClient()

    private init() {}

    func request(endpoint: APIEndpoint) async throws -> Data {
        Logger.info("Requesting endpoint: \(endpoint.path)")
        return Data()
    }
}
