import ComposableArchitecture
import Core

public extension Repos {
    struct State: Equatable {
        public var isInitialized: Bool
        public var repos: DataState<[Repo]>
        public var searchKey: String
        public var searchedRepos: DataState<SearchResponse<Repo>>

        public init(
            isInitialized: Bool = false,
            repos: DataState<[Repo]> = .loading,
            searchKey: String = "",
            searchedRepos: DataState<SearchResponse<Repo>> = .loading
        ) {
            self.isInitialized = isInitialized
            self.repos = repos
            self.searchKey = searchKey
            self.searchedRepos = searchedRepos
        }
    }
}
