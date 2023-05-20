import Foundation

public struct RepoLicense: Equatable, Hashable, Decodable {
    public let key: String
    public let name: String
    public let spdxId: String?
    public let nodeId: String

    public enum CodingKeys: String, CodingKey {
        case key
        case name
        case spdxId = "spdx_id"
        case nodeId = "node_id"
    }

    public init(key: String, name: String, spdxId: String?, nodeId: String) {
        self.key = key
        self.name = name
        self.spdxId = spdxId
        self.nodeId = nodeId
    }
}

#if DEBUG
public extension RepoLicense {
    static func mock(
        key: String = "mit",
        name: String = "MIT License",
        spdxId: String? = "MIT",
        nodeId: String = "MDc6TGljZW5zZTEz"
    ) -> Self {
        .init(
            key: key,
            name: name,
            spdxId: spdxId,
            nodeId: nodeId
        )
    }
}
#endif
