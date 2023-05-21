import Combine
import Core
import Foundation
import Network
import Users_Repository

public extension UsersService {
    static let live: Self = Self(
        listUsers: listUsers,
        getUser: getUser,
        searchUser: searchUser
    )
}

private extension UsersService {
    static func listUsers(request: ListRequest) -> AnyPublisher<[User], GHError> {
        MoyaManager
            .usersProvider
            .listUsers(request: request)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    static func getUser(username: String) -> AnyPublisher<User, GHError> {
        MoyaManager
            .usersProvider
            .getUser(username: username)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    static func searchUser(request: SearchRequest) -> AnyPublisher<SearchResponse<User>, GHError> {
        MoyaManager
            .usersProvider
            .searchUser(request: request)
            .map { $0 }
            .eraseToAnyPublisher()
    }
}
