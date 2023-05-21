import ComposableArchitecture
import Core
import Home

public extension Logged {
    enum Action: Equatable {
        case onAppear
        case selectTab(TabBarType)
        case home(Home.Action)
    }
}
