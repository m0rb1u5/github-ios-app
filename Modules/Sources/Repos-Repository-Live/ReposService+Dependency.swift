import ComposableArchitecture
import Core
import Repos_Repository

public struct ReposServiceKey: DependencyKey {
    public static var liveValue: ReposService = .live
    #if DEBUG
    public static var testValue: ReposService = .mocking()
    public static var previewValue: ReposService = .mocking()
    #endif
}

public extension DependencyValues {
    var reposService: ReposService {
        get { self[ReposServiceKey.self] }
        set { self[ReposServiceKey.self] = newValue }
    }
}
