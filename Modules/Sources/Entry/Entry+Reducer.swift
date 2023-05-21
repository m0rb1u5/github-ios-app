import Combine
import ComposableArchitecture
import Core
import Logged
import Network
import os.log
import Unlogged

public extension Entry {
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                if !state.isInitialized {
                    NetworkManager.initialize()
                    state.isInitialized = true
                    return .none
                }
                return .none

            case .logged:
                return .none

            case .unlogged:
                return .none
            }
        }
        .ifLet(\.logged, action: /Action.logged) {
            Logged()
        }
        .ifLet(\.unlogged, action: /Action.unlogged) {
            Unlogged()
        }
    }
}
