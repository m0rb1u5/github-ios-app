import ComposableArchitecture
import Core
import Orgs_Repository

public struct OrgsServiceKey: DependencyKey {
    public static var liveValue: OrgsService = .live
    #if DEBUG
    public static var testValue: OrgsService = .mocking()
    public static var previewValue: OrgsService = .mocking()
    #endif
}

public extension DependencyValues {
    var orgsService: OrgsService {
        get { self[OrgsServiceKey.self] }
        set { self[OrgsServiceKey.self] = newValue }
    }
}
