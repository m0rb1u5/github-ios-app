import Foundation

public extension Date {
    var toString: String {
        let formatter: ISO8601DateFormatter = ISO8601DateFormatter()

        formatter.formatOptions = [
            .withInternetDateTime
        ]
        return formatter.string(from: self)
    }

    func formatTime(_ dateStyle: DateFormatter.Style = .short, _ timeStyle: DateFormatter.Style = .short) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle
        return dateFormatter.string(from: self)
    }
}
