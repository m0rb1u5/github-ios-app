import Foundation

public extension String {
    var toDate: Date? {
        let formatter: ISO8601DateFormatter = ISO8601DateFormatter()

        formatter.formatOptions = [
            .withInternetDateTime
        ]
        return formatter.date(from: self)
    }
}
