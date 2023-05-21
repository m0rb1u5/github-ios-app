import Foundation

public struct SearchRequest: Equatable, Hashable, Encodable {
    public let query: String
    public let sort: SortType?
    public let order: OrderType?
    public let perPage: Int?
    public let page: Int?

    public enum CodingKeys: String, CodingKey {
        case query = "q"
        case sort
        case order
        case perPage = "per_page"
        case page = "page"
    }

    public init(query: String, sort: SortType? = nil, order: OrderType? = nil, perPage: Int? = nil, page: Int? = nil) {
        self.query = query
        self.sort = sort
        self.order = order
        self.perPage = perPage
        self.page = page
    }
}

#if DEBUG
public extension SearchRequest {
    static func mock(
        query: String = "tor",
        sort: SortType? = .joined,
        order: OrderType? = .asc,
        perPage: Int? = 20,
        page: Int? = 1
    ) -> Self {
        .init(
            query: query,
            sort: sort,
            order: order,
            perPage: perPage,
            page: page
        )
    }
}
#endif
