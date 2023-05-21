import Combine
import ComposableArchitecture
import Core
import os.log

public extension Users {
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            struct CancelID {
            }

            switch action {
            case .onAppear:
                if !state.isInitialized {
                    state.isInitialized = true
                    return .init(value: .fetchUsers)
                }
                return .none

            case .fetchUsers:
                state.users = .loading
                return usersService
                    .listUsers(.init(perPage: 100))
                    .catchToEffect()
                    .map(Users.Action.handleUsers)

            case let .handleUsers(.success(users)):
                state.users = .loaded(users)
                return .none

            case let .handleUsers(.failure(error)):
                state.users = .error(error)
                return .init(value: .logError(error))

            case let .searchedUsers(key):
                state.searchKey = key
                state.searchedUsers = .loading
                return .init(value: .fetchSearchUsers)
                    .debounce(id: CancelID.self, for: .seconds(1), scheduler: mainQueue)

            case .fetchSearchUsers:
                state.searchedUsers = .loading
                return usersService
                    .searchUser(.init(query: state.searchKey, sort: .joined, order: .asc, perPage: 100, page: 1))
                    .catchToEffect()
                    .map(Users.Action.handleSearchUsers)

            case let .handleSearchUsers(.success(searchedUsers)):
                state.searchedUsers = .loaded(searchedUsers)
                return .none

            case let .handleSearchUsers(.failure(error)):
                state.searchedUsers = .error(error)
                return .init(value: .logError(error))

            case let .logError(error):
                Logger(subsystem: "Users", category: "Service").error("\(error.errorDescription ?? "")")
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
        .ifLet(\.userDetail, action: /Action.userDetail) {
            UserDetail()
        }
    }
}
