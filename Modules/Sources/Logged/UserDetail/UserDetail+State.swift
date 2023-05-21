import ComposableArchitecture
import Core

public extension UserDetail {
    struct State: Equatable {
        public var username: String
        public var user: DataState<User>
        /*public var eventDetail: EventDetail.State?
        public var eventDetailIsPresented: Bool
        public var eventsState: Events.State?*/

        public init(
            username: String,
            user: DataState<User> = .loading
            /*eventDetail: EventDetail.State? = nil,
            eventDetailIsPresented: Bool = false,
            eventsState: Events.State? = nil*/
        ) {
            self.username = username
            self.user = user
        }
    }
}
