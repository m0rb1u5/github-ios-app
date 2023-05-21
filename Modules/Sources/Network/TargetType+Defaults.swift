import Foundation
import Moya

public extension TargetType {
    var baseURL: URL {
        MoyaManager.baseURL
    }

    var validationType: ValidationType {
        .successCodes
    }

    var headers: [String: String]? {
        [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
    }
}
