import Combine
import ComposableArchitecture
import Core
import os.log

public extension Unlogged {
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                if !state.isInitialized {
                    state.isInitialized = true
                    return .none
                }
                return .none
            }
        }
    }
}
