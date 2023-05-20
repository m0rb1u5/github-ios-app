import Combine
import Foundation

public enum GHError: Error, Equatable {
    case text(String)

    public init(_ error: Error) {
        self = .text(error.localizedDescription)
    }

    public init(_ error: String) {
        self = .text(error)
    }
}

extension GHError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .text(text):
            return text
        }
    }
}

#if DEBUG
public extension GHError {
    static var mock: Self {
        .text("ERROR_MOCK")
    }
}
#endif
