import Combine
import ComposableArchitecture
import Core
import Dispatch
import Orgs_Repository
import Orgs_Repository_Live
import Repos_Repository
import Repos_Repository_Live
import Users_Repository
import Users_Repository_Live

public struct UserDetail: ReducerProtocol {
    @Dependency(\.usersService) var usersService: UsersService
    @Dependency(\.reposService) var reposService: ReposService
    @Dependency(\.orgsService) var orgsService: OrgsService

    public var mainQueue: AnySchedulerOf<DispatchQueue>
}

public extension UserDetail {
    init(
        mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()
    ) {
        self.mainQueue = mainQueue
    }
}
