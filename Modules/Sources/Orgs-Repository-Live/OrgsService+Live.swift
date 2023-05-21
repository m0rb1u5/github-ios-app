import Combine
import Core
import Foundation
import Network
import Orgs_Repository

public extension OrgsService {
    static let live: Self = Self(
        listOrgs: listOrgs,
        listOrgsForUser: listOrgsForUser,
        getOrg: getOrg
    )
}

private extension OrgsService {
    static func listOrgs(request: ListRequest) -> AnyPublisher<[Org], GHError> {
        MoyaManager
            .orgsProvider
            .listOrgs(request: request)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    static func listOrgsForUser(username: String, request: ListOrgsRequest) -> AnyPublisher<[Org], GHError> {
        MoyaManager
            .orgsProvider
            .listOrgsForUser(username: username, request: request)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    static func getOrg(org: String) -> AnyPublisher<Org, GHError> {
        MoyaManager
            .orgsProvider
            .getOrg(org: org)
            .map { $0 }
            .eraseToAnyPublisher()
    }
}
