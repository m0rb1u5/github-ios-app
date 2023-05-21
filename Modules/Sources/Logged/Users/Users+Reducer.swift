import Combine
import ComposableArchitecture
import Core
import os.log

public extension Users {
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
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
