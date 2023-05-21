import Combine
import Core
import Foundation
import Moya

public enum OrgsEndpoint {
    case listOrgs(request: ListRequest)
    case listOrgsForUser(username: String, request: ListOrgsRequest)
    case getOrg(org: String)
}

extension OrgsEndpoint: TargetType {
    public var path: String {
        switch self {
        case .listOrgs:
            return "/organizations"

        case let .listOrgsForUser(username, _):
            return "/users/\(username)/orgs"

        case let .getOrg(org):
            return "/orgs/\(org)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .listOrgs, .listOrgsForUser, .getOrg:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case let .listOrgs(request):
            guard let dict = try? request.asDictionary() else {
                return .requestPlain
            }
            return .requestParameters(parameters: dict, encoding: URLEncoding.default)

        case let .listOrgsForUser(_, request):
            guard let dict = try? request.asDictionary() else {
                return .requestPlain
            }
            return .requestParameters(parameters: dict, encoding: URLEncoding.default)

        case .getOrg:
            return .requestPlain
        }
    }

    public var sampleData: Data {
        return Data()
    }
}

public extension MoyaProvider where Target == OrgsEndpoint {
    func listOrgs(request: ListRequest) -> AnyPublisher<[Org], GHError> {
        future(.listOrgs(request: request))
    }

    func listOrgsForUser(username: String, request: ListOrgsRequest) -> AnyPublisher<[Org], GHError> {
        future(.listOrgsForUser(username: username, request: request))
    }

    func getOrg(org: String) -> AnyPublisher<Org, GHError> {
        future(.getOrg(org: org))
    }
}
