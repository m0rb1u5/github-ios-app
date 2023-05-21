import Alamofire
import Core
import Foundation
import UIKit

// swiftlint:disable: implicitly_unwrapped_optional
// swiftlint:disable: force_unwrapping
public final class NetworkManager {
    public private(set) static var instance: NetworkManager!

    public static func initialize() {
        instance = .init()
    }

    init() {
        setupManagers()
    }

    private func setupManagers() {
        let configuration: URLSessionConfiguration = getURLSessionConfig()

        let session: Session = createSession(
            configuration: configuration
        )

        MoyaManager.initialize(
            baseURL: currentBaseURL(),
            session: session
        )
    }

    func getURLSessionConfig() -> URLSessionConfiguration {
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 90
        configuration.httpAdditionalHeaders = [
            "Accept": "application/vnd.github+json",
            "X-GitHub-Api-Version": "2022-11-28"
        ]
        return configuration
    }

    func createSession(configuration: URLSessionConfiguration) -> Session {
        Session(configuration: configuration)
    }

    func currentBaseURL() -> URL {
        URL(string: "https://api.github.com")!
    }
}
// swiftlint:enable: implicitly_unwrapped_optional
// swiftlint:enable: force_unwrapping
