import ComposableArchitecture
import Core

public extension Logged {
    enum Action: Equatable {
        case onAppear
        case selectTab(TabBarType)
        case home(Home.Action)
        case users(Users.Action)
        case repos(Repos.Action)
        case orgs(Orgs.Action)
    }
}
