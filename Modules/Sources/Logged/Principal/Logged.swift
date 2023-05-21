import Combine
import ComposableArchitecture
import Core
import Dispatch

public struct Logged: ReducerProtocol {
    public var mainQueue: AnySchedulerOf<DispatchQueue>

    public init(
        mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()
    ) {
        self.mainQueue = mainQueue
    }
}
