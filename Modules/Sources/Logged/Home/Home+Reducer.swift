import Combine
import ComposableArchitecture
import Core
import os.log

public extension Home {
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
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
                /*if value {
                    state.eventsState = .init()
                }*/
                return .none

            case let .seeAllRepos(value):
                state.seeAllRepos = value
                return .none

            case let .seeAllOrgs(value):
                state.seeAllOrgs = value
                return .none

            case let .logError(error):
                Logger(subsystem: "Home", category: "Service").error("\(error.errorDescription ?? "")")
                return .none

            /*case let .eventSelected(event):
                state.eventDetail = .init(eventId: event.id, eventTitle: event.title)
                return .init(value: .presentEventDetail(true))

            case let .presentEventDetail(isPresented):
                state.eventDetailIsPresented = isPresented
                return .none

            case .eventDetail:
                return .none

            case .events:
                return .none*/
            }
        }
        /*.ifLet(\.eventDetail, action: /Action.eventDetail) {
            EventDetail()
        }
        .ifLet(\.eventsState, action: /Action.events) {
            Events()
        }*/
    }
}
