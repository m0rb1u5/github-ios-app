import Foundation
import LocalAuthentication

public extension ProcessInfo {
    static var isTest: Bool {
        #if DEBUG
        ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
        #else
        false
        #endif
    }
}
