import Foundation
import Moya

public final class MoyaManager {
    // swiftlint:disable: implicitly_unwrapped_optional
    public private(set) static var session: Session!
    public private(set) static var baseURL: URL!

    private init() {}

    static func initialize(
        baseURL: URL,
        session: Session
    ) {
        self.baseURL = baseURL
        self.session = session
    }
}
// swiftlint:enable: implicitly_unwrapped_optional
