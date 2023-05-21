import Combine
import ComposableArchitecture
import Core
import os.log

public extension Repos {
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
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
