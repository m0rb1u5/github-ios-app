import Combine
import Core
import Foundation
import Moya

public enum ReposEndpoint {
    case listRepos(since: Int?)
    case listReposForUser(username: String, request: ListReposRequest)
    case getRepo(owner: String, repo: String)
    case searchRepo(request: SearchRequest)
}

extension ReposEndpoint: TargetType {
    public var path: String {
        switch self {
        case .listRepos:
            return "/repositories"

        case let .listReposForUser(username, _):
            return "/users/\(username)/repos"

        case let .getRepo(owner, repo):
            return "/repos/\(owner)/\(repo)"

        case .searchRepo:
            return "/search/repositories"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .listRepos, .listReposForUser, .getRepo, .searchRepo:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case let .listRepos(since):
            guard let since: Int else {
                return .requestPlain
            }
            return .requestParameters(parameters: ["since": since], encoding: URLEncoding.default)

        case let .listReposForUser(_, request):
            guard let dict = try? request.asDictionary() else {
                return .requestPlain
            }
            return .requestParameters(parameters: dict, encoding: URLEncoding.default)

        case .getRepo:
            return .requestPlain

        case let .searchRepo(request):
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

public extension MoyaProvider where Target == ReposEndpoint {
    func listRepos(since: Int?) -> AnyPublisher<[Repo], GHError> {
        future(.listRepos(since: since))
    }

    func listReposForUser(username: String, request: ListReposRequest) -> AnyPublisher<[Repo], GHError> {
        future(.listReposForUser(username: username, request: request))
    }

    func getRepo(owner: String, repo: String) -> AnyPublisher<Repo, GHError> {
        future(.getRepo(owner: owner, repo: repo))
    }

    func searchRepo(request: SearchRequest) -> AnyPublisher<SearchResponse<Repo>, GHError> {
        future(.searchRepo(request: request))
    }
}
