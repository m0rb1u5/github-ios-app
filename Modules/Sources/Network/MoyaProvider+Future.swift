import Combine
import Core
import Foundation
import Moya
import os.log

public extension MoyaProvider {
    func future<Model>(
        _ target: Target,
        responseKeyPath: String? = nil,
        failsOnEmptyData: Bool = true
    ) -> AnyPublisher<Model, GHError> where Model: Decodable {
        Future {
            self.request(
                target,
                completion: self.mapResponseClosure(
                    atKeyPath: responseKeyPath,
                    failsOnEmptyData: failsOnEmptyData,
                    completion: $0
                )
            )
        }
        .eraseToAnyPublisher()
    }
}

extension MoyaProvider {
    func mapResponseClosure<ResponseType: Decodable>(
        atKeyPath keyPath: String?,
        failsOnEmptyData: Bool,
        completion: @escaping (Result<ResponseType, GHError>) -> Void
    ) -> Completion {
        let completion: Completion = { result in
            switch result {
            case .success(let response):
                let responseURL: String = response.request?.url?.absoluteString ?? "NO_URL"
                do {
                    Logger(subsystem: "Network", category: "Service").info("Response: SUCCESS \(responseURL)")
                    let value: ResponseType = try JSONDecoder.custom().decode(
                        ResponseType.self,
                        from: response.data
                    )
                    completion(.success(value))
                } catch {
                    let moyaError: MoyaError = MoyaError.objectMapping(error, response)
                    Logger(subsystem: "Network", category: "Service")
                        .info("Response: SUCCESS \(responseURL) - \(moyaError)")
                    completion(.failure(GHError(moyaError)))
                }

            case .failure(let error):
                let responseURL: String = error.response?.request?.url?.absoluteString ?? "NO_URL"
                Logger(subsystem: "Network", category: "Service")
                    .info("Request: ERROR \(responseURL) - \(error) ")
                switch error {
                case let .underlying(error, response):
                    if let _: Response = response {
                        completion(.failure(GHError("Error")))
                    } else if error.asAFError?.isRequestRetryError == true {
                        completion(.failure(GHError("connectionError")))
                    }

                default:
                    completion(.failure(GHError(error)))
                }
                completion(.failure(GHError(error)))
            }
        }
        return completion
    }
}
