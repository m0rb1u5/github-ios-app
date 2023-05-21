import ComposableArchitecture
import Core

public extension UserDetail {
    enum Action: Equatable {
        case onAppear
        case fetchUser
        case handleUser(Result<User, GHError>)
        case fetchRepos
        case handleRepos(Result<[Repo], GHError>)
        case fetchOrgs
        case handleOrgs(Result<[Org], GHError>)
        case logError(GHError)
    }
}
