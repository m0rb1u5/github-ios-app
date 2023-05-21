import ComposableArchitecture
import Core

public extension Users {
    enum Action: Equatable {
        case onAppear
        case fetchUsers
        case handleUsers(Result<[User], GHError>)
        case searchedUsers(String)
        case fetchSearchUsers
        case handleSearchUsers(Result<SearchResponse<User>, GHError>)
        case logError(GHError)
        case userSelected(User)
        case presentUserDetail(Bool)
        case userDetail(UserDetail.Action)
    }
}
