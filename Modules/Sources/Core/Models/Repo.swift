import Foundation

public struct Repo: Equatable, Hashable, Decodable, Identifiable {
    // MARK: - Basic Repo Properties
    public let id: Int
    public let nodeId: String
    public let name: String
    public let fullName: String
    public let isPrivate: Bool
    public let owner: User
    public let htmlUrl: URL
    public let description: String?
    public let fork: Bool

    // MARK: - Detail Repo Properties
    public let createdAt: Date?
    public let updatedAt: Date?
    public let pushedAt: Date?
    public let gitUrl: URL?
    public let sshUrl: URL?
    public let cloneUrl: URL?
    public let svnUrl: URL?
    public let homepage: URL?
    public let size: Int?
    public let stargazersCount: Int?
    public let watchersCount: Int?
    public let language: String?
    public let hasIssues: Bool?
    public let hasProjects: Bool?
    public let hasDownloads: Bool?
    public let hasWiki: Bool?
    public let hasPages: Bool?
    public let hasDiscussions: Bool?
    public let forksCount: Int?
    public let mirrorUrl: URL?
    public let archived: Bool?
    public let disabled: Bool?
    public let openIssuesCount: Int?
    public let license: RepoLicense?
    public let allowForking: Bool?
    public let isTemplate: Bool?
    public let webCommitSignoffRequired: Bool?
    public let topics: [String]?
    public let visibility: String?
    public let forks: Int?
    public let openIssues: Int?
    public let watchers: Int?
    public let defaultBranch: String?
    public let tempCloneToken: String?
    public let networkCount: Int?
    public let subscribersCount: Int?

    public var title: String {
        fullName
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case nodeId = "node_id"
        case name
        case fullName = "full_name"
        case isPrivate = "private"
        case owner
        case htmlUrl = "html_url"
        case description
        case fork
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case gitUrl = "git_url"
        case sshUrl = "ssh_url"
        case cloneUrl = "clone_url"
        case svnUrl = "svn_url"
        case homepage
        case size
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case hasDiscussions = "has_discussions"
        case forksCount = "forks_count"
        case mirrorUrl = "mirror_url"
        case archived
        case disabled
        case openIssuesCount = "open_issues_count"
        case license
        case allowForking = "allow_forking"
        case isTemplate = "is_template"
        case webCommitSignoffRequired = "web_commit_signoff_required"
        case topics
        case visibility
        case forks
        case openIssues = "open_issues"
        case watchers
        case defaultBranch = "default_branch"
        case tempCloneToken = "temp_clone_token"
        case networkCount = "network_count"
        case subscribersCount = "subscribers_count"
    }

    public init(
        id: Int,
        nodeId: String,
        name: String,
        fullName: String,
        isPrivate: Bool,
        owner: User,
        htmlUrl: URL,
        description: String? = nil,
        fork: Bool,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        pushedAt: Date? = nil,
        gitUrl: URL? = nil,
        sshUrl: URL? = nil,
        cloneUrl: URL? = nil,
        svnUrl: URL? = nil,
        homepage: URL? = nil,
        size: Int? = nil,
        stargazersCount: Int? = nil,
        watchersCount: Int? = nil,
        language: String? = nil,
        hasIssues: Bool? = nil,
        hasProjects: Bool? = nil,
        hasDownloads: Bool? = nil,
        hasWiki: Bool? = nil,
        hasPages: Bool? = nil,
        hasDiscussions: Bool? = nil,
        forksCount: Int? = nil,
        mirrorUrl: URL? = nil,
        archived: Bool? = nil,
        disabled: Bool? = nil,
        openIssuesCount: Int? = nil,
        license: RepoLicense? = nil,
        allowForking: Bool? = nil,
        isTemplate: Bool? = nil,
        webCommitSignoffRequired: Bool? = nil,
        topics: [String]? = nil,
        visibility: String? = nil,
        forks: Int? = nil,
        openIssues: Int? = nil,
        watchers: Int? = nil,
        defaultBranch: String? = nil,
        tempCloneToken: String? = nil,
        networkCount: Int? = nil,
        subscribersCount: Int? = nil
    ) {
        self.id = id
        self.nodeId = nodeId
        self.name = name
        self.fullName = fullName
        self.isPrivate = isPrivate
        self.owner = owner
        self.htmlUrl = htmlUrl
        self.description = description
        self.fork = fork
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.pushedAt = pushedAt
        self.gitUrl = gitUrl
        self.sshUrl = sshUrl
        self.cloneUrl = cloneUrl
        self.svnUrl = svnUrl
        self.homepage = homepage
        self.size = size
        self.stargazersCount = stargazersCount
        self.watchersCount = watchersCount
        self.language = language
        self.hasIssues = hasIssues
        self.hasProjects = hasProjects
        self.hasDownloads = hasDownloads
        self.hasWiki = hasWiki
        self.hasPages = hasPages
        self.hasDiscussions = hasDiscussions
        self.forksCount = forksCount
        self.mirrorUrl = mirrorUrl
        self.archived = archived
        self.disabled = disabled
        self.openIssuesCount = openIssuesCount
        self.license = license
        self.allowForking = allowForking
        self.isTemplate = isTemplate
        self.webCommitSignoffRequired = webCommitSignoffRequired
        self.topics = topics
        self.visibility = visibility
        self.forks = forks
        self.openIssues = openIssues
        self.watchers = watchers
        self.defaultBranch = defaultBranch
        self.tempCloneToken = tempCloneToken
        self.networkCount = networkCount
        self.subscribersCount = subscribersCount
    }
}

#if DEBUG
public extension Repo {
    static func mock(
        id: Int = 1,
        nodeId: String = "MDEwOlJlcG9zaXRvcnkx",
        name: String = "grit",
        fullName: String = "mojombo/grit",
        isPrivate: Bool = false,
        owner: User = .mock(),
        htmlUrl: URL = URL(string: "https://github.com/mojombo/grit") ?? URL(fileURLWithPath: ""),
        // swiftlint:disable line_length
        description: String? = "**Grit is no longer maintained. Check out libgit2/rugged.** Grit gives you object oriented read/write access to Git repositories via Ruby.",
        // swiftlint:enable line_length
        fork: Bool = false,
        createdAt: Date? = "2007-10-29T14:37:16Z".toDate,
        updatedAt: Date? = "2023-05-10T18:37:32Z".toDate,
        pushedAt: Date? = "2020-10-01T03:55:32Z".toDate,
        gitUrl: URL? = URL(string: "git://github.com/mojombo/grit.git"),
        sshUrl: URL? = URL(string: "git@github.com:mojombo/grit.git"),
        cloneUrl: URL? = URL(string: "https://github.com/mojombo/grit.git"),
        svnUrl: URL? = URL(string: "https://github.com/mojombo/grit"),
        homepage: URL? = URL(string:  "http://grit.rubyforge.org/"),
        size: Int? = 7954,
        stargazersCount: Int? = 1964,
        watchersCount: Int? = 1964,
        language: String? = "Ruby",
        hasIssues: Bool? = true,
        hasProjects: Bool? = true,
        hasDownloads: Bool? = true,
        hasWiki: Bool? = true,
        hasPages: Bool? = false,
        hasDiscussions: Bool? = false,
        forksCount: Int? = 536,
        mirrorUrl: URL? = nil,
        archived: Bool? = false,
        disabled: Bool? = false,
        openIssuesCount: Int? = 30,
        license: RepoLicense? = .mock(),
        allowForking: Bool? = true,
        isTemplate: Bool? = false,
        webCommitSignoffRequired: Bool? = false,
        topics: [String]? = ["octocat", "atom", "electron", "api"],
        visibility: String? = "public",
        forks: Int? = 536,
        openIssues: Int? = 30,
        watchers: Int? = 1964,
        defaultBranch: String? = "master",
        tempCloneToken: String? = nil,
        networkCount: Int? = 536,
        subscribersCount: Int? = 72
    ) -> Self {
        .init(
            id: id,
            nodeId: nodeId,
            name: name,
            fullName: fullName,
            isPrivate: isPrivate,
            owner: owner,
            htmlUrl: htmlUrl,
            description: description,
            fork: fork,
            createdAt: createdAt,
            updatedAt: updatedAt,
            pushedAt: pushedAt,
            gitUrl: gitUrl,
            sshUrl: sshUrl,
            cloneUrl: cloneUrl,
            svnUrl: svnUrl,
            homepage: homepage,
            size: size,
            stargazersCount: stargazersCount,
            watchersCount: watchersCount,
            language: language,
            hasIssues: hasIssues,
            hasProjects: hasProjects,
            hasDownloads: hasDownloads,
            hasWiki: hasWiki,
            hasPages: hasPages,
            hasDiscussions: hasDiscussions,
            forksCount: forksCount,
            mirrorUrl: mirrorUrl,
            archived: archived,
            disabled: disabled,
            openIssuesCount: openIssuesCount,
            license: license,
            allowForking: allowForking,
            isTemplate: isTemplate,
            webCommitSignoffRequired: webCommitSignoffRequired,
            topics: topics,
            visibility: visibility,
            forks: forks,
            openIssues: openIssues,
            watchers: watchers,
            defaultBranch: defaultBranch,
            tempCloneToken: tempCloneToken,
            networkCount: networkCount,
            subscribersCount: subscribersCount
        )
    }
}
#endif
