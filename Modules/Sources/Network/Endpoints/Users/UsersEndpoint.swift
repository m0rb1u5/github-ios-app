import Combine
import Core
import Foundation
import Moya

public enum UsersEndpoint {
    case listUsers(request: ListRequest)
    case getUser(username: String)
    case searchUser(request: SearchRequest)
}

extension UsersEndpoint: TargetType {
    public var path: String {
        switch self {
        case .listUsers:
            return "/users"

        case let .getUser(username):
            return "/users/\(username)"

        case .searchUser:
            return "/search/users"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .listUsers, .getUser, .searchUser:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case let .listUsers(request):
            guard let dict = try? request.asDictionary() else {
                return .requestPlain
            }
            return .requestParameters(parameters: dict, encoding: URLEncoding.default)

        case .getUser:
            return .requestPlain

        case let .searchUser(request):
            guard let dict = try? request.asDictionary() else {
                return .requestPlain
            }
            return .requestParameters(parameters: dict, encoding: URLEncoding.default)
        }
    }

    public var sampleData: Data {
        return Data()
    }
}

public extension MoyaProvider where Target == UsersEndpoint {
    func listUsers(request: ListRequest) -> AnyPublisher<[User], GHError> {
        future(.listUsers(request: request))
    }

    func getUser(username: String) -> AnyPublisher<User, GHError> {
        future(.getUser(username: username))
    }

    func searchUser(request: SearchRequest) -> AnyPublisher<SearchResponse<User>, GHError> {
        future(.searchUser(request: request))
    }
}
