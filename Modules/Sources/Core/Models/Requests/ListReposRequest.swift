import Foundation

public struct ListReposRequest: Equatable, Hashable, Encodable {
    public let type: RepoType?
    public let sort: SortReposType?
    public let direction: OrderType?
    public let perPage: Int?
    public let page: Int?

    public enum CodingKeys: String, CodingKey {
        case type
        case sort
        case direction
        case perPage = "per_page"
        case page = "page"
    }

    public init(
        type: RepoType? = nil,
        sort: SortReposType? = nil,
        direction: OrderType? = nil,
        perPage: Int? = nil,
        page: Int? = nil
    ) {
        self.type = type
        self.sort = sort
        self.direction = direction
        self.perPage = perPage
        self.page = page
    }
}

#if DEBUG
public extension ListReposRequest {
    static func mock(
        type: RepoType? = .all,
        sort: SortReposType? = .fullName,
        direction: OrderType? = .asc,
        perPage: Int? = 20,
        page: Int? = 1
    ) -> Self {
        .init(
            type: type,
            sort: sort,
            direction: direction,
            perPage: perPage,
            page: page
        )
    }
}
#endif
