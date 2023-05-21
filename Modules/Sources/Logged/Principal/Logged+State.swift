import ComposableArchitecture
import Core

public extension Logged {
    struct State: Equatable {
        public var isInitialized: Bool
        public var selectedTab: TabBarType
        public var tabs: [TabBarType]
        public var home: Home.State?
        public var users: Users.State?
        public var repos: Repos.State?

        public init(
            isInitialized: Bool = false,
            selectedTab: TabBarType = .home,
            tabs: [TabBarType] = TabBarType.allCases,
            home: Home.State? = .init(),
            users: Users.State? = .init(),
            repos: Repos.State? = .init()
        ) {
            self.isInitialized = isInitialized
            self.selectedTab = selectedTab
            self.tabs = tabs
            self.home = home
            self.users = users
            self.repos = repos
        }
    }
}
