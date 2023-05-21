import Combine
import ComposableArchitecture
import Core
import os.log

public extension Repos {
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            struct CancelID {
            }

            switch action {
            case .onAppear:
                if !state.isInitialized {
                    state.isInitialized = true
                    return .init(value: .fetchRepos)
                }
                return .none

            case .fetchRepos:
                state.repos = .loading
                return reposService
                    .listRepos(nil)
                    .catchToEffect()
                    .map(Repos.Action.handleRepos)

            case let .handleRepos(.success(repos)):
                state.repos = .loaded(repos)
                return .none

            case let .handleRepos(.failure(error)):
                state.repos = .error(error)
                return .init(value: .logError(error))

            case let .searchedRepos(key):
                state.searchKey = key
                state.searchedRepos = .loading
                return .init(value: .fetchSearchRepos)
                    .debounce(id: CancelID.self, for: .seconds(1), scheduler: mainQueue)

            case .fetchSearchRepos:
                state.searchedRepos = .loading
                return reposService
                    .searchRepo(.init(query: state.searchKey, sort: .joined, order: .asc, perPage: 100, page: 1))
                    .catchToEffect()
                    .map(Repos.Action.handleSearchRepos)

            case let .handleSearchRepos(.success(searchedRepos)):
                state.searchedRepos = .loaded(searchedRepos)
                return .none

            case let .handleSearchRepos(.failure(error)):
                state.searchedRepos = .error(error)
                return .init(value: .logError(error))

            case let .logError(error):
                Logger(subsystem: "Repos", category: "Service").error("\(error.errorDescription ?? "")")
                return .none
            }
        }
    }
}
