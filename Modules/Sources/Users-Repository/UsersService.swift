import Combine
import Core

public struct UsersService {
    public var listUsers: (_ request: ListRequest) -> AnyPublisher<[User], GHError>
    public var getUser: (_ username: String) -> AnyPublisher<User, GHError>
    public var searchUser: (_ request: SearchRequest) -> AnyPublisher<SearchResponse<User>, GHError>

    public init(
        listUsers: @escaping (_ request: ListRequest) -> AnyPublisher<[User], GHError>,
        getUser: @escaping (_ username: String) -> AnyPublisher<User, GHError>,
        searchUser: @escaping (_ request: SearchRequest) -> AnyPublisher<SearchResponse<User>, GHError>
    ) {
        self.listUsers = listUsers
        self.getUser = getUser
        self.searchUser = searchUser
    }
}

#if DEBUG
import Foundation
import XCTestDynamicOverlay

public extension UsersService {
    static let failing: Self = .init(
        listUsers: { _ in
            Fail(
                outputType: [User].self,
                failure: GHError.mock
            )
            .eraseToAnyPublisher()
        },
        getUser: { _ in
            Fail(
                outputType: User.self,
                failure: GHError.mock
            )
            .eraseToAnyPublisher()
        },
        searchUser: { _ in
            Fail(
                outputType: SearchResponse<User>.self,
                failure: GHError.mock
            )
            .eraseToAnyPublisher()
        }
    )

    static func mocking(
        users: [User] = User.mockUsers(),
        user: User = .mock(),
        searchUsers: SearchResponse<User> = User.mockSearchUsers()
    ) -> Self {
        .init(
            listUsers: { request in
                Just(users)
                    .delay(for: .seconds(Double.random(in: 0..<1.0)), scheduler: RunLoop.main)
                    .setFailureType(to: GHError.self)
                    .eraseToAnyPublisher()
            },
            getUser: { username in
                Just(user)
                    .delay(for: .seconds(Double.random(in: 0..<1.0)), scheduler: RunLoop.main)
                    .setFailureType(to: GHError.self)
                    .eraseToAnyPublisher()
            },
            searchUser: { request in
                Just(searchUsers)
                    .delay(for: .seconds(Double.random(in: 0..<1.0)), scheduler: RunLoop.main)
                    .setFailureType(to: GHError.self)
                    .eraseToAnyPublisher()
            }
        )
    }
}
#endif
