import ComposableArchitecture
import Core
import Home

public extension Logged {
    struct State: Equatable {
        public var isInitialized: Bool
        public var selectedTab: TabBarType
        public var tabs: [TabBarType]
        public var home: Home.State?

        public init(
            isInitialized: Bool = false,
            selectedTab: TabBarType = .home,
            tabs: [TabBarType] = TabBarType.allCases,
            home: Home.State? = .init()
        ) {
            self.isInitialized = isInitialized
            self.selectedTab = selectedTab
            self.tabs = tabs
            self.home = home
        }
    }
}
