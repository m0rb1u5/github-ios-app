import ComposableArchitecture
import Core

public extension Unlogged {
    struct State: Equatable {
        public var isInitialized: Bool

        public init(
            isInitialized: Bool = false
        ) {
            self.isInitialized = isInitialized
        }
    }
}
