import ComposableArchitecture
import Core

public extension Orgs {
    enum Action: Equatable {
        case onAppear
        case fetchOrgs
        case handleOrgs(Result<[Org], GHError>)
        case logError(GHError)
        /*case eventSelected(Event)
        case presentEventDetail(Bool)
        case eventDetail(EventDetail.Action)
        case events(Events.Action)*/
    }
}
