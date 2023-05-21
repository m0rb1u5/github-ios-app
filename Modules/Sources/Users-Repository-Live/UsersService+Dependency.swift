import ComposableArchitecture
import Core
import Users_Repository

public struct UsersServiceKey: DependencyKey {
    public static var liveValue: UsersService = .mocking()
    #if DEBUG
    public static var testValue: UsersService = .mocking()
    public static var previewValue: UsersService = .mocking()
    #endif
}

public extension DependencyValues {
    var usersService: UsersService {
        get { self[UsersServiceKey.self] }
        set { self[UsersServiceKey.self] = newValue }
    }
}
