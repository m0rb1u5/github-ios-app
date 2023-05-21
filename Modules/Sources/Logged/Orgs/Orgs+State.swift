import ComposableArchitecture
import Core

public extension Orgs {
    struct State: Equatable {
        public var isInitialized: Bool
        public var orgs: DataState<[Org]>
        /*public var eventDetail: EventDetail.State?
        public var eventDetailIsPresented: Bool
        public var eventsState: Events.State?*/

        public init(
            isInitialized: Bool = false,
            orgs: DataState<[Org]> = .loading
            /*eventDetail: EventDetail.State? = nil,
            eventDetailIsPresented: Bool = false,
            eventsState: Events.State? = nil*/
        ) {
            self.isInitialized = isInitialized
            self.orgs = orgs
        }
    }
}
