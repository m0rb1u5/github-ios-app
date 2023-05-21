import ComposableArchitecture
import Core

public extension UserDetail {
    struct State: Equatable {
        public var username: String
        public var user: DataState<User>
        public var repos: DataState<[Repo]>
        public var orgs: DataState<[Org]>

        public init(
            username: String,
            user: DataState<User> = .loading,
            repos: DataState<[Repo]> = .loading,
            orgs: DataState<[Org]> = .loading
        ) {
            self.username = username
            self.user = user
            self.repos = repos
            self.orgs = orgs
        }
    }
}
