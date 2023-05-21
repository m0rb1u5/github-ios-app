import Combine
import ComposableArchitecture
import Core
import os.log

public extension UserDetail {
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .merge([
                    .init(value: .fetchUser),
                    .init(value: .fetchRepos)
                ])

            case .fetchUser:
                state.user = .loading
                return usersService
                    .getUser(state.username)
                    .catchToEffect()
                    .map(UserDetail.Action.handleUser)

            case let .handleUser(.success(user)):
                state.user = .loaded(user)
                return .none

            case let .handleUser(.failure(error)):
                state.user = .error(error)
                return .init(value: .logError(error))

            case .fetchRepos:
                state.repos = .loading
                return reposService
                    .listReposForUser(
                        state.username, .init(
                            type: .all,
                            sort: .updated,
                            direction: .asc,
                            perPage: 20,
                            page: 1
                        )
                    )
                    .catchToEffect()
                    .map(UserDetail.Action.handleRepos)

            case let .handleRepos(.success(repos)):
                state.repos = .loaded(repos)
                return .none

            case let .handleRepos(.failure(error)):
                state.repos = .error(error)
                return .init(value: .logError(error))

            case let .logError(error):
                Logger(subsystem: "UserDetail", category: "Service").error("\(error.errorDescription ?? "")")
                return .none
            }
        }
    }
}
