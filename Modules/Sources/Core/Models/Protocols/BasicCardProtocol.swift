import Foundation

public protocol BasicCardProtocol {
    var id: Int { get }
    var title: String { get }
    var avatarUrl: URL { get }
}
