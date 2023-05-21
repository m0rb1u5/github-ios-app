import ComposableArchitecture
import Core

public extension Orgs {
    struct State: Equatable {
        public var isInitialized: Bool
        public var orgs: DataState<[Org]>

        public init(
            isInitialized: Bool = false,
            orgs: DataState<[Org]> = .loading
        ) {
            self.isInitialized = isInitialized
            self.orgs = orgs
        }
    }
}
