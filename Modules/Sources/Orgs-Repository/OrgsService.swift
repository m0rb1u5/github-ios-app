import Combine
import Core

public struct OrgsService {
    public var listOrgs: (_ request: ListRequest) -> AnyPublisher<[Org], GHError>
    public var listOrgsForUser: (_ username: String, _ request: ListOrgsRequest) -> AnyPublisher<[Org], GHError>
    public var getOrg: (_ org: String) -> AnyPublisher<Org, GHError>

    public init(
        listOrgs: @escaping (_ request: ListRequest) -> AnyPublisher<[Org], GHError>,
        listOrgsForUser: @escaping (_ username: String, _ request: ListOrgsRequest) -> AnyPublisher<[Org], GHError>,
        getOrg: @escaping (_ org: String) -> AnyPublisher<Org, GHError>
    ) {
        self.listOrgs = listOrgs
        self.listOrgsForUser = listOrgsForUser
        self.getOrg = getOrg
    }
}

#if DEBUG
import Foundation
import XCTestDynamicOverlay

public extension OrgsService {
    static let failing: Self = .init(
        listOrgs: { _ in
            Fail(
                outputType: [Org].self,
                failure: GHError.mock
            )
            .eraseToAnyPublisher()
        },
        listOrgsForUser: { _, _ in
            Fail(
                outputType: [Org].self,
                failure: GHError.mock
            )
            .eraseToAnyPublisher()
        },
        getOrg: { _ in
            Fail(
                outputType: Org.self,
                failure: GHError.mock
            )
            .eraseToAnyPublisher()
        }
    )

    static func mocking(
        orgs: [Org] = Org.mockOrgs(),
        orgsForUser: [Org] = Org.mockOrgs(),
        org: Org = .mock()
    ) -> Self {
        .init(
            listOrgs: { _ in
                Just(orgs)
                    .delay(for: .seconds(Double.random(in: 0..<1.0)), scheduler: RunLoop.main)
                    .setFailureType(to: GHError.self)
                    .eraseToAnyPublisher()
            },
            listOrgsForUser: { _, _ in
                Just(orgsForUser)
                    .delay(for: .seconds(Double.random(in: 0..<1.0)), scheduler: RunLoop.main)
                    .setFailureType(to: GHError.self)
                    .eraseToAnyPublisher()
            },
            getOrg: { _ in
                Just(org)
                    .delay(for: .seconds(Double.random(in: 0..<1.0)), scheduler: RunLoop.main)
                    .setFailureType(to: GHError.self)
                    .eraseToAnyPublisher()
            }
        )
    }
}
#endif
