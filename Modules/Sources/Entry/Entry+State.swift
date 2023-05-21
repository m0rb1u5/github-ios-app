import ComposableArchitecture
import Core
import Logged
import Unlogged

public extension Entry {
    struct State: Equatable {
        public var isInitialized: Bool
        public var isLogged: Bool
        public var logged: Logged.State?
        public var unlogged: Unlogged.State?

        public init(
            isInitialized: Bool = false,
            isLogged: Bool = true,
            logged: Logged.State? = .init(),
            unlogged: Unlogged.State? = .init()
        ) {
            self.isInitialized = isInitialized
            self.isLogged = isLogged
            self.logged = logged
            self.unlogged = unlogged
        }
    }
}
