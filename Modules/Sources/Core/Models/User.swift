import Foundation

public struct User: BasicCardProtocol, Equatable, Hashable, Decodable, Identifiable {
    // MARK: - Basic User Properties
    public let name: String?
    public let email: String?
    public let login: String
    public let id: Int
    public let nodeId: String
    public let avatarUrl: URL
    public let gravatarId: String?
    public let htmlUrl: URL
    public let type: String
    public let siteAdmin: Bool

    // MARK: - Detail User Properties
    public let company: String?
    public let blog: URL?
    public let location: String?
    public let hireable: Bool?
    public let bio: String?
    public let twitterUsername: String?
    public let publicRepos: Int?
    public let publicGists: Int?
    public let followers: Int?
    public let following: Int?
    public let createdAt: Date?
    public let updatedAt: Date?

    // MARK: - My user Properties
    public let privateGists: Int?
    public let totalPrivateRepos: Int?
    public let ownedPrivateRepos: Int?
    public let diskUsage: Int?
    public let collaborators: Int?
    public let twoFactorAuthentication: Bool?
    public let plan: UserPlan?
    public let suspendedAt: Date?
    public let businessPlus: Bool?
    public let ldapDn: String?

    public var title: String {
        if let name: String {
            if let company: String {
                return name + " (" + company + ")"
            }
            return name
        }
        return login
    }

    public enum CodingKeys: String, CodingKey {
        case name
        case email
        case login
        case id
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case gravatarId = "gravatar_id"
        case htmlUrl = "html_url"
        case type = "type"
        case siteAdmin = "site_admin"
        case company
        case blog
        case location
        case hireable
        case bio
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers
        case following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case privateGists = "private_gists"
        case totalPrivateRepos = "total_private_repos"
        case ownedPrivateRepos = "owned_private_repos"
        case diskUsage = "disk_usage"
        case collaborators
        case twoFactorAuthentication = "two_factor_authentication"
        case plan
        case suspendedAt = "suspended_at"
        case businessPlus = "business_plus"
        case ldapDn = "ldap_dn"
    }

    public init(
        name: String? = nil,
        email: String? = nil,
        login: String,
        id: Int,
        nodeId: String,
        avatarUrl: URL,
        gravatarId: String? = nil,
        htmlUrl: URL,
        type: String,
        siteAdmin: Bool,
        company: String? = nil,
        blog: URL? = nil,
        location: String? = nil,
        hireable: Bool? = nil,
        bio: String? = nil,
        twitterUsername: String? = nil,
        publicRepos: Int? = nil,
        publicGists: Int? = nil,
        followers: Int? = nil,
        following: Int? = nil,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        privateGists: Int? = nil,
        totalPrivateRepos: Int? = nil,
        ownedPrivateRepos: Int? = nil,
        diskUsage: Int? = nil,
        collaborators: Int? = nil,
        twoFactorAuthentication: Bool? = nil,
        plan: UserPlan? = nil,
        suspendedAt: Date? = nil,
        businessPlus: Bool? = nil,
        ldapDn: String? = nil
    ) {
        self.name = name
        self.email = email
        self.login = login
        self.id = id
        self.nodeId = nodeId
        self.avatarUrl = avatarUrl
        self.gravatarId = gravatarId
        self.htmlUrl = htmlUrl
        self.type = type
        self.siteAdmin = siteAdmin
        self.company = company
        self.blog = blog
        self.location = location
        self.hireable = hireable
        self.bio = bio
        self.twitterUsername = twitterUsername
        self.publicRepos = publicRepos
        self.publicGists = publicGists
        self.followers = followers
        self.following = following
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.privateGists = privateGists
        self.totalPrivateRepos = totalPrivateRepos
        self.ownedPrivateRepos = ownedPrivateRepos
        self.diskUsage = diskUsage
        self.collaborators = collaborators
        self.twoFactorAuthentication = twoFactorAuthentication
        self.plan = plan
        self.suspendedAt = suspendedAt
        self.businessPlus = businessPlus
        self.ldapDn = ldapDn
    }
}

#if DEBUG
public extension User {
    static func mock(
        name: String? = "Linus Torvalds",
        email: String? = nil,
        login: String = "torvalds",
        id: Int = 1_024_025,
        nodeId: String = "MDQ6VXNlcjEwMjQwMjU",
        avatarUrl: URL = URL(string: "https://avatars.githubusercontent.com/u/1024025?v=4") ?? URL(fileURLWithPath: ""),
        gravatarId: String? = "",
        htmlUrl: URL = URL(string: "https://github.com/torvalds") ?? URL(fileURLWithPath: ""),
        type: String = "User",
        siteAdmin: Bool = false,
        company: String? = "Linux Foundation",
        blog: URL? = nil,
        location: String? = "Portland, OR",
        hireable: Bool? = nil,
        bio: String? = nil,
        twitterUsername: String? = nil,
        publicRepos: Int? = 7,
        publicGists: Int? = 0,
        followers: Int? = 183_027,
        following: Int? = 0,
        createdAt: Date? = "2011-09-03T15:26:22Z".toDate,
        updatedAt: Date? = "2023-01-02T22:41:59Z".toDate,
        privateGists: Int? = nil,
        totalPrivateRepos: Int? = nil,
        ownedPrivateRepos: Int? = nil,
        diskUsage: Int? = nil,
        collaborators: Int? = nil,
        twoFactorAuthentication: Bool? = nil,
        plan: UserPlan? = nil,
        suspendedAt: Date? = nil,
        businessPlus: Bool? = nil,
        ldapDn: String? = nil
    ) -> Self {
        .init(
            name: name,
            email: email,
            login: login,
            id: id,
            nodeId: nodeId,
            avatarUrl: avatarUrl,
            gravatarId: gravatarId,
            htmlUrl: htmlUrl,
            type: type,
            siteAdmin: siteAdmin,
            company: company,
            blog: blog,
            location: location,
            hireable: hireable,
            bio: bio,
            twitterUsername: twitterUsername,
            publicRepos: publicRepos,
            publicGists: publicGists,
            followers: followers,
            following: following,
            createdAt: createdAt,
            updatedAt: updatedAt,
            privateGists: privateGists,
            totalPrivateRepos: totalPrivateRepos,
            ownedPrivateRepos: ownedPrivateRepos,
            diskUsage: diskUsage,
            collaborators: collaborators,
            twoFactorAuthentication: twoFactorAuthentication,
            plan: plan,
            suspendedAt: suspendedAt,
            businessPlus: businessPlus,
            ldapDn: ldapDn
        )
    }

    static func mockUsers() -> [Self] {
        [
            .mock(),
            .mock(
                login: "mojombo",
                id: 1,
                nodeId: "MDQ6VXNlcjE=",
                avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/1?v=4") ?? URL(fileURLWithPath: ""),
                htmlUrl: URL(string: "https://github.com/mojombo") ?? URL(fileURLWithPath: "")
            ),
            .mock(
                login: "defunkt",
                id: 2,
                nodeId: "MDQ6VXNlcjI=",
                avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/2?v=4") ?? URL(fileURLWithPath: ""),
                htmlUrl: URL(string: "https://github.com/defunkt") ?? URL(fileURLWithPath: "")
            ),
            .mock(
                login: "pjhyett",
                id: 3,
                nodeId: "MDQ6VXNlcjM=",
                avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/3?v=4") ?? URL(fileURLWithPath: ""),
                htmlUrl: URL(string: "https://github.com/pjhyett") ?? URL(fileURLWithPath: "")
            ),
            .mock(
                login: "wycats",
                id: 4,
                nodeId: "MDQ6VXNlcjQ=",
                avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/4?v=4") ?? URL(fileURLWithPath: ""),
                htmlUrl: URL(string: "https://github.com/wycats") ?? URL(fileURLWithPath: "")
            ),
            .mock(
                login: "ezmobius",
                id: 5,
                nodeId: "MDQ6VXNlcjU=",
                avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/5?v=4") ?? URL(fileURLWithPath: ""),
                htmlUrl: URL(string: "https://github.com/ezmobius") ?? URL(fileURLWithPath: "")
            )
        ]
    }

    static func mockSearchUsers() -> SearchResponse<User> {
        .init(totalCount: User.mockUsers().count, incompleteResults: false, items: User.mockUsers())
    }
}
#endif
