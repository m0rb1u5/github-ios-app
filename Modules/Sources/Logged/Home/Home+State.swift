import ComposableArchitecture
import Core

public extension Home {
    struct State: Equatable {
        public var isInitialized: Bool
        public var users: DataState<[User]>
        public var repos: DataState<[Repo]>
        public var orgs: DataState<[Org]>
        public var seeAllUsers: Bool
        public var seeAllRepos: Bool
        public var seeAllOrgs: Bool
        public var usersState: Users.State?
        public var reposState: Repos.State?
        public var orgsState: Orgs.State?
        /*public var eventDetail: EventDetail.State?
        public var eventDetailIsPresented: Bool
        public var eventsState: Events.State?*/

        public init(
            isInitialized: Bool = false,
            users: DataState<[User]> = .loading,
            repos: DataState<[Repo]> = .loading,
            orgs: DataState<[Org]> = .loading,
            seeAllUsers: Bool = false,
            seeAllRepos: Bool = false,
            seeAllOrgs: Bool = false,
            usersState: Users.State? = nil,
            reposState: Repos.State? = nil,
            orgsState: Orgs.State? = nil
            /*eventDetail: EventDetail.State? = nil,
            eventDetailIsPresented: Bool = false,
            eventsState: Events.State? = nil*/
        ) {
            self.isInitialized = isInitialized
            self.users = users
            self.repos = repos
            self.orgs = orgs
            self.seeAllUsers = seeAllUsers
            self.seeAllRepos = seeAllRepos
            self.seeAllOrgs = seeAllOrgs
            self.usersState = usersState
            self.reposState = reposState
            self.orgsState = orgsState
        }
    }
}
