import ComposableArchitecture
import Core

public extension Home {
    enum Action: Equatable {
        case onAppear
        case fetchUsers
        case handleUsers(Result<[User], GHError>)
        case fetchRepos
        case handleRepos(Result<[Repo], GHError>)
        case fetchOrgs
        case handleOrgs(Result<[Org], GHError>)
        case seeAllUsers(Bool)
        case seeAllRepos(Bool)
        case seeAllOrgs(Bool)
        case logError(GHError)
        case users(Users.Action)
        case repos(Repos.Action)
        case orgs(Orgs.Action)
        /*case eventSelected(Event)
        case presentEventDetail(Bool)
        case eventDetail(EventDetail.Action)
        case events(Events.Action)*/
    }
}
