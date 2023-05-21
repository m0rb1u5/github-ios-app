import ComposableArchitecture
import Core

public extension Orgs {
    enum Action: Equatable {
        case onAppear
        case fetchOrgs
        case handleOrgs(Result<[Org], GHError>)
        case logError(GHError)
    }
}
