import ComposableArchitecture
import Core

public extension Users {
    struct State: Equatable {
        public var isInitialized: Bool
        public var users: DataState<[User]>
        /*public var eventDetail: EventDetail.State?
        public var eventDetailIsPresented: Bool
        public var eventsState: Events.State?*/

        public init(
            isInitialized: Bool = false,
            users: DataState<[User]> = .loading
            /*eventDetail: EventDetail.State? = nil,
            eventDetailIsPresented: Bool = false,
            eventsState: Events.State? = nil*/
        ) {
            self.isInitialized = isInitialized
            self.users = users
        }
    }
}
