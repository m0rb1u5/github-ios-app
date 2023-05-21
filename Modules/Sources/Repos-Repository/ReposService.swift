import Combine
import Core

public struct ReposService {
    public var listRepos: (_ since: Int?) -> AnyPublisher<[Repo], GHError>
    public var listReposForUser: (_ username: String, _ request: ListReposRequest) -> AnyPublisher<[Repo], GHError>
    public var getRepo: (_ owner: String, _ repo: String) -> AnyPublisher<Repo, GHError>
    public var searchRepo: (_ request: SearchRequest) -> AnyPublisher<SearchResponse<Repo>, GHError>

    public init(
        listRepos: @escaping (_ since: Int?) -> AnyPublisher<[Repo], GHError>,
        listReposForUser: @escaping (_ username: String, _ request: ListReposRequest) -> AnyPublisher<[Repo], GHError>,
        getRepo: @escaping (_ owner: String, _ repo: String) -> AnyPublisher<Repo, GHError>,
        searchRepo: @escaping (_ request: SearchRequest) -> AnyPublisher<SearchResponse<Repo>, GHError>
    ) {
        self.listRepos = listRepos
        self.listReposForUser = listReposForUser
        self.getRepo = getRepo
        self.searchRepo = searchRepo
    }
}

#if DEBUG
import Foundation
import XCTestDynamicOverlay

public extension ReposService {
    static let failing: Self = .init(
        listRepos: { _ in
            Fail(
                outputType: [Repo].self,
                failure: GHError.mock
            )
            .eraseToAnyPublisher()
        },
        listReposForUser: { _, _ in
            Fail(
                outputType: [Repo].self,
                failure: GHError.mock
            )
            .eraseToAnyPublisher()
        },
        getRepo: { _, _ in
            Fail(
                outputType: Repo.self,
                failure: GHError.mock
            )
            .eraseToAnyPublisher()
        },
        searchRepo: { _ in
            Fail(
                outputType: SearchResponse<Repo>.self,
                failure: GHError.mock
            )
            .eraseToAnyPublisher()
        }
    )

    static func mocking(
        repos: [Repo] = Repo.mockRepos(),
        reposForUser: [Repo] = Repo.mockRepos(),
        repo: Repo = .mock(),
        searchRepos: SearchResponse<Repo> = Repo.mockSearchRepos()
    ) -> Self {
        .init(
            listRepos: { since in
                Just(repos)
                    .delay(for: .seconds(Double.random(in: 0..<1.0)), scheduler: RunLoop.main)
                    .setFailureType(to: GHError.self)
                    .eraseToAnyPublisher()
            },
            listReposForUser: { username, request in
                Just(reposForUser)
                    .delay(for: .seconds(Double.random(in: 0..<1.0)), scheduler: RunLoop.main)
                    .setFailureType(to: GHError.self)
                    .eraseToAnyPublisher()
            },
            getRepo: { owner, repoName in
                Just(repo)
                    .delay(for: .seconds(Double.random(in: 0..<1.0)), scheduler: RunLoop.main)
                    .setFailureType(to: GHError.self)
                    .eraseToAnyPublisher()
            },
            searchRepo: { request in
                Just(searchRepos)
                    .delay(for: .seconds(Double.random(in: 0..<1.0)), scheduler: RunLoop.main)
                    .setFailureType(to: GHError.self)
                    .eraseToAnyPublisher()
            }
        )
    }
}
#endif
