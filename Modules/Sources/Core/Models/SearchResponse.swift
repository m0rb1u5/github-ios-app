import Foundation

public struct SearchResponse<K: Equatable & Hashable & Decodable>: Equatable, Hashable, Decodable {
    public let totalCount: Int
    public let incompleteResults: Bool
    public let items: [K]

    public enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }

    public init(totalCount: Int, incompleteResults: Bool, items: [K]) {
        self.totalCount = totalCount
        self.incompleteResults = incompleteResults
        self.items = items
    }
}
