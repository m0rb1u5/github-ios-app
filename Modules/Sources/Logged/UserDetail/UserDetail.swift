import Combine
import ComposableArchitecture
import Core
import Dispatch
import Users_Repository
import Users_Repository_Live

public struct UserDetail: ReducerProtocol {
    @Dependency(\.usersService) var usersService: UsersService

    public var mainQueue: AnySchedulerOf<DispatchQueue>
}

public extension UserDetail {
    init(
        mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()
    ) {
        self.mainQueue = mainQueue
    }
}
