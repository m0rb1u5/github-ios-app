import ComposableArchitecture
import Core

public extension Repos {
    enum Action: Equatable {
        case onAppear
        case fetchRepos
        case handleRepos(Result<[Repo], GHError>)
        case logError(GHError)
        /*case eventSelected(Event)
        case presentEventDetail(Bool)
        case eventDetail(EventDetail.Action)
        case events(Events.Action)*/
    }
}
