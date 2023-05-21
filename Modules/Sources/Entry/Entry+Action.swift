import ComposableArchitecture
import Core
import Logged
import Unlogged

public extension Entry {
    enum Action: Equatable {
        case onAppear
        case logged(Logged.Action)
        case unlogged(Unlogged.Action)
    }
}
