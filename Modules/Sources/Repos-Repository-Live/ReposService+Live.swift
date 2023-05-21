import Combine
import Core
import Foundation
import Network
import Repos_Repository

public extension ReposService {
    static let live: Self = Self(
        listRepos: listRepos,
        listReposForUser: listReposForUser,
        getRepo: getRepo,
        searchRepo: searchRepo
    )
}

private extension ReposService {
    static func listRepos(since: Int?) -> AnyPublisher<[Repo], GHError> {
        MoyaManager
            .reposProvider
            .listRepos(since: since)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    static func listReposForUser(username: String, request: ListReposRequest) -> AnyPublisher<[Repo], GHError> {
        MoyaManager
            .reposProvider
            .listReposForUser(username: username, request: request)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    static func getRepo(owner: String, repo: String) -> AnyPublisher<Repo, GHError> {
        MoyaManager
            .reposProvider
            .getRepo(owner: owner, repo: repo)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    static func searchRepo(request: SearchRequest) -> AnyPublisher<SearchResponse<Repo>, GHError> {
        MoyaManager
            .reposProvider
            .searchRepo(request: request)
            .map { $0 }
            .eraseToAnyPublisher()
    }
}
