import ComposableArchitecture
import Core

public extension Repos {
    struct State: Equatable {
        public var isInitialized: Bool
        public var repos: DataState<[Repo]>
        /*public var eventDetail: EventDetail.State?
        public var eventDetailIsPresented: Bool
        public var eventsState: Events.State?*/

        public init(
            isInitialized: Bool = false,
            repos: DataState<[Repo]> = .loading
            /*eventDetail: EventDetail.State? = nil,
            eventDetailIsPresented: Bool = false,
            eventsState: Events.State? = nil*/
        ) {
            self.isInitialized = isInitialized
            self.repos = repos
        }
    }
}
