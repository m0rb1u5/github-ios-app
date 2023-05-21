import Combine
import ComposableArchitecture
import Core
import os.log

public extension Home {
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.seeAllUsers = false
                state.seeAllRepos = false
                state.seeAllOrgs = false
                if !state.isInitialized {
                    state.isInitialized = true
                    return .merge([
                        .init(value: .fetchUsers),
                        .init(value: .fetchRepos),
                        .init(value: .fetchOrgs)
                    ])
                }
                return .none

            case .fetchUsers:
                state.users = .loading
                return usersService
                    .listUsers(.init(perPage: 20))
                    .catchToEffect()
                    .map(Home.Action.handleUsers)

            case let .handleUsers(.success(users)):
                state.users = .loaded(users)
                return .none

            case let .handleUsers(.failure(error)):
                state.users = .error(error)
                return .init(value: .logError(error))

            case .fetchRepos:
                state.repos = .loading
                return reposService
                    .listRepos(nil)
                    .catchToEffect()
                    .map(Home.Action.handleRepos)

            case let .handleRepos(.success(repos)):
                state.repos = .loaded(repos)
                return .none

            case let .handleRepos(.failure(error)):
                state.repos = .error(error)
                return .init(value: .logError(error))

            case .fetchOrgs:
                state.orgs = .loading
                return orgsService
                    .listOrgs(.init(perPage: 20))
                    .catchToEffect()
                    .map(Home.Action.handleOrgs)

            case let .handleOrgs(.success(orgs)):
                state.orgs = .loaded(orgs)
                return .none

            case let .handleOrgs(.failure(error)):
                state.orgs = .error(error)
                return .init(value: .logError(error))

            case let .seeAllUsers(value):
                state.seeAllUsers = value
                if value {
                    state.usersState = .init()
                } else {
                    state.usersState = nil
                }
                return .none

            case let .seeAllRepos(value):
                state.seeAllRepos = value
                if value {
                    state.reposState = .init()
                } else {
                    state.reposState = nil
                }
                return .none

            case let .seeAllOrgs(value):
                state.seeAllOrgs = value
                if value {
                    state.orgsState = .init()
                } else {
                    state.orgsState = nil
                }
                return .none

            case let .logError(error):
                Logger(subsystem: "Home", category: "Service").error("\(error.errorDescription ?? "")")
                return .none

            case .users:
                return .none

            case .repos:
                return .none

            case .orgs:
                return .none

            case let .userSelected(user):
                state.userDetail = .init(username: user.login)
                return .init(value: .presentUserDetail(true))

            case let .presentUserDetail(isPresented):
                state.userDetailIsPresented = isPresented
                return .none

            case .userDetail:
                return .none
            }
        }
        .ifLet(\.usersState, action: /Action.users) {
            Users()
        }
        .ifLet(\.reposState, action: /Action.repos) {
            Repos()
        }
        .ifLet(\.orgsState, action: /Action.orgs) {
            Orgs()
        }
        .ifLet(\.userDetail, action: /Action.userDetail) {
            UserDetail()
        }
    }
}
