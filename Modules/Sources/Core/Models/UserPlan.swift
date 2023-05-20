import Foundation

public struct UserPlan: Equatable, Hashable, Decodable {
    public let collaborators: Int
    public let name: String
    public let space: Int
    public let privateRepos: Int

    public enum CodingKeys: String, CodingKey {
        case collaborators
        case name
        case space
        case privateRepos = "private_repos"
    }

    public init(collaborators: Int, name: String, space: Int, privateRepos: Int) {
        self.collaborators = collaborators
        self.name = name
        self.space = space
        self.privateRepos = privateRepos
    }
}

#if DEBUG
public extension UserPlan {
    static func mock(
        collaborators: Int = 0,
        name: String = "Medium",
        space: Int = 400,
        privateRepos: Int = 20
    ) -> Self {
        .init(
            collaborators: collaborators,
            name: name,
            space: space,
            privateRepos: privateRepos
        )
    }
}
#endif
