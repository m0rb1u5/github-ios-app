import Combine
import ComposableArchitecture
import Core
import Dispatch
import Users_Repository
import Users_Repository_Live

public struct Users: ReducerProtocol {
    @Dependency(\.usersService) var usersService: UsersService

    public var mainQueue: AnySchedulerOf<DispatchQueue>
}

public extension Users {
    init(
        mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()
    ) {
        self.mainQueue = mainQueue
    }
}
