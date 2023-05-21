import Combine
import ComposableArchitecture
import Core
import os.log

public extension Orgs {
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                if !state.isInitialized {
                    state.isInitialized = true
                    return .init(value: .fetchOrgs)
                }
                return .none

            case .fetchOrgs:
                state.orgs = .loading
                return orgsService
                    .listOrgs(.init(perPage: 100))
                    .catchToEffect()
                    .map(Orgs.Action.handleOrgs)

            case let .handleOrgs(.success(orgs)):
                state.orgs = .loaded(orgs)
                return .none

            case let .handleOrgs(.failure(error)):
                state.orgs = .error(error)
                return .init(value: .logError(error))

            case let .logError(error):
                Logger(subsystem: "Orgs", category: "Service").error("\(error.errorDescription ?? "")")
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
