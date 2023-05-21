import Combine
import ComposableArchitecture
import Core
import Dispatch
import Orgs_Repository
import Orgs_Repository_Live
import Users_Repository
import Users_Repository_Live
import Repos_Repository
import Repos_Repository_Live

public struct Home: ReducerProtocol {
    @Dependency(\.orgsService) var orgsService: OrgsService
    @Dependency(\.usersService) var usersService: UsersService
    @Dependency(\.reposService) var reposService: ReposService

    public var mainQueue: AnySchedulerOf<DispatchQueue>
}

public extension Home {
    init(
        mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()
    ) {
        self.mainQueue = mainQueue
    }
}
