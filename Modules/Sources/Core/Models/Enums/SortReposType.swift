import Foundation

public enum SortReposType: String, Codable {
    case fullName = "full_name"
    case created
    case updated
    case pushed
}
