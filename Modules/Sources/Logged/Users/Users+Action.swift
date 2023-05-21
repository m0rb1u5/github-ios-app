import ComposableArchitecture
import Core

public extension Users {
    enum Action: Equatable {
        case onAppear
        case fetchUsers
        case handleUsers(Result<[User], GHError>)
        case logError(GHError)
        /*case eventSelected(Event)
        case presentEventDetail(Bool)
        case eventDetail(EventDetail.Action)
        case events(Events.Action)*/
    }
}
