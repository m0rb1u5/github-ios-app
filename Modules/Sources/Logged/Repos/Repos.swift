import Combine
import ComposableArchitecture
import Core
import Dispatch
import Repos_Repository
import Repos_Repository_Live

public struct Repos: ReducerProtocol {
    @Dependency(\.reposService) var reposService: ReposService

    public var mainQueue: AnySchedulerOf<DispatchQueue>
}

public extension Repos {
    init(
        mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()
    ) {
        self.mainQueue = mainQueue
    }
}
