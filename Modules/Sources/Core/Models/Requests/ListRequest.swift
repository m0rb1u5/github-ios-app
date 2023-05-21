import Foundation

public struct ListRequest: Equatable, Hashable, Encodable {
    public let since: Int?
    public let perPage: Int?

    public enum CodingKeys: String, CodingKey {
        case since
        case perPage = "per_page"
    }

    public init(since: Int? = nil, perPage: Int? = nil) {
        self.since = since
        self.perPage = perPage
    }
}

#if DEBUG
public extension ListRequest {
    static func mock(
        since: Int? = 0,
        perPage: Int? = 20
    ) -> Self {
        .init(
            since: since,
            perPage: perPage
        )
    }
}
#endif
