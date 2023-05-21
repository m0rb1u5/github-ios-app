import Foundation

public struct ListOrgsRequest: Equatable, Hashable, Encodable {
    public let perPage: Int?
    public let page: Int?

    public enum CodingKeys: String, CodingKey {
        case perPage = "per_page"
        case page = "page"
    }

    public init(
        perPage: Int? = nil,
        page: Int? = nil
    ) {
        self.perPage = perPage
        self.page = page
    }
}

#if DEBUG
public extension ListOrgsRequest {
    static func mock(
        perPage: Int? = 20,
        page: Int? = 1
    ) -> Self {
        .init(
            perPage: perPage,
            page: page
        )
    }
}
#endif
