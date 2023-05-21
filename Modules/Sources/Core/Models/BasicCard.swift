import Foundation

public struct BasicCard: BasicCardProtocol, Equatable, Hashable, Identifiable {
    public let id: Int
    public let title: String
    public let avatarUrl: URL

    public init(id: Int, title: String, avatarUrl: URL) {
        self.id = id
        self.title = title
        self.avatarUrl = avatarUrl
    }
}
