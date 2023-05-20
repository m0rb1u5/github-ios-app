import Foundation

public extension Date {
    var toString: String {
        let formatter: ISO8601DateFormatter = ISO8601DateFormatter()

        formatter.formatOptions = [
            .withInternetDateTime
        ]
        return formatter.string(from: self)
    }
}
