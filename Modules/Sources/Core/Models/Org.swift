import Foundation

public struct Org: BasicCardProtocol, Equatable, Hashable, Decodable, Identifiable {
    // MARK: - Basic Org Properties
    public let login: String
    public let orgId: Int
    public let nodeId: String
    public let avatarUrl: URL
    public let description: String?

    // MARK: - Detail Org Properties
    public let name: String?
    public let company: String?
    public let blog: URL?
    public let location: String?
    public let email: String?
    public let twitterUsername: String?
    public let isVerified: Bool?
    public let hasOrganizationProjects: Bool?
    public let hasRepositoryProjects: Bool?
    public let publicRepos: Int?
    public let publicGists: Int?
    public let followers: Int?
    public let following: Int?
    public let htmlUrl: URL?
    public let createdAt: Date?
    public let updatedAt: Date?
    public let type: String?

    public var id: String {
        String(orgId)
    }

    public var title: String {
        if let name {
            if let company {
                return name + " (" + company + ")"
            }
            return name
        }
        return login
    }

    public enum CodingKeys: String, CodingKey {
        case login
        case orgId = "id"
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case description
        case name
        case company
        case blog
        case location
        case email
        case twitterUsername = "twitter_username"
        case isVerified = "is_verified"
        case hasOrganizationProjects = "has_organization_projects"
        case hasRepositoryProjects = "has_repository_projects"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers
        case following
        case htmlUrl = "html_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case type
    }

    public init(
        login: String,
        orgId: Int,
        nodeId: String,
        avatarUrl: URL,
        description: String? = nil,
        name: String? = nil,
        company: String? = nil,
        blog: URL? = nil,
        location: String? = nil,
        email: String? = nil,
        twitterUsername: String? = nil,
        isVerified: Bool? = nil,
        hasOrganizationProjects: Bool? = nil,
        hasRepositoryProjects: Bool? = nil,
        publicRepos: Int? = nil,
        publicGists: Int? = nil,
        followers: Int? = nil,
        following: Int? = nil,
        htmlUrl: URL? = nil,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        type: String? = nil
    ) {
        self.login = login
        self.orgId = orgId
        self.nodeId = nodeId
        self.avatarUrl = avatarUrl
        self.description = description
        self.name = name
        self.company = company
        self.blog = blog
        self.location = location
        self.email = email
        self.twitterUsername = twitterUsername
        self.isVerified = isVerified
        self.hasOrganizationProjects = hasOrganizationProjects
        self.hasRepositoryProjects = hasRepositoryProjects
        self.publicRepos = publicRepos
        self.publicGists = publicGists
        self.followers = followers
        self.following = following
        self.htmlUrl = htmlUrl
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.type = type
    }
}

#if DEBUG
public extension Org {
    static func mock(
        login: String = "engineyard",
        orgId: Int = 81,
        nodeId: String = "MDEyOk9yZ2FuaXphdGlvbjgx",
        avatarUrl: URL = URL(string: "https://avatars.githubusercontent.com/u/81?v=4") ?? URL(fileURLWithPath: ""),
        description: String? = nil,
        name: String? = "Engine Yard, Inc.",
        company: String? = nil,
        blog: URL? = URL(string: "https://www.engineyard.com"),
        location: String? = "San Francisco, CA",
        email: String? = nil,
        twitterUsername: String? = nil,
        isVerified: Bool? = false,
        hasOrganizationProjects: Bool? = true,
        hasRepositoryProjects: Bool? = true,
        publicRepos: Int? = 333,
        publicGists: Int? = 25,
        followers: Int? = 6,
        following: Int? = 0,
        htmlUrl: URL? = URL(string: "https://github.com/engineyard"),
        createdAt: Date? = "2008-01-29T09:51:30Z".toDate,
        updatedAt: Date? = "2023-02-19T08:13:44Z".toDate,
        type: String? = "Organization"
    ) -> Self {
        .init(
            login: login,
            orgId: orgId,
            nodeId: nodeId,
            avatarUrl: avatarUrl,
            description: description,
            name: name,
            company: company,
            blog: blog,
            location: location,
            email: email,
            twitterUsername: twitterUsername,
            isVerified: isVerified,
            hasOrganizationProjects: hasOrganizationProjects,
            hasRepositoryProjects: hasRepositoryProjects,
            publicRepos: publicRepos,
            publicGists: publicGists,
            followers: followers,
            following: following,
            htmlUrl: htmlUrl,
            createdAt: createdAt,
            updatedAt: updatedAt,
            type: type
        )
    }
}
#endif
