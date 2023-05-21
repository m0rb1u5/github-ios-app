import Combine
import ComposableArchitecture
import Core
import Dispatch
import Orgs_Repository
import Orgs_Repository_Live

public struct Orgs: ReducerProtocol {
    @Dependency(\.orgsService) var orgsService: OrgsService

    public var mainQueue: AnySchedulerOf<DispatchQueue>
}

public extension Orgs {
    init(
        mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()
    ) {
        self.mainQueue = mainQueue
    }
}
