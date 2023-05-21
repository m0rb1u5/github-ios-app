import ComposableArchitecture
import Core

public extension Repos {
    enum Action: Equatable {
        case onAppear
        case fetchRepos
        case handleRepos(Result<[Repo], GHError>)
        case searchedRepos(String)
        case fetchSearchRepos
        case handleSearchRepos(Result<SearchResponse<Repo>, GHError>)
        case logError(GHError)
    }
}
