import Combine
import ComposableArchitecture
import Core
import Home
import os.log

public extension Logged {
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                if !state.isInitialized {
                    state.isInitialized = true
                    return .none
                }
                return .none

            case let .selectTab(tab):
                state.selectedTab = tab
                return .none

            case .home:
                return .none
            }
        }
        .ifLet(\.home, action: /Action.home) {
            Home()
        }
    }
}
